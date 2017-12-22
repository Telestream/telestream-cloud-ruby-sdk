require 'pathname'
require 'json'
require 'concurrent'

module TelestreamCloud::Qc
  class Uploader
    class FileReader
      attr_reader :file

      def initialize(path)
        @mutex = Mutex.new
        @path = path
        reopen
      end

      def [](range)
        @mutex.synchronize do
          file.seek(range.begin)
          file.read(range.size)
        end
      end

      def size
        @size ||= file.size
      end

      def name
        Pathname.new(file.path).basename
      end

      def close
        @file.close
        @file = nil
      end

      def reopen
        @file ||= File.open(@path)
      end
    end

    class FileUploadSession
      attr_reader :uploader, :reader, :tag

      def initialize(uploader, path, tag = nil)
        @uploader = uploader
        @reader = FileReader.new(path)
        @tag = tag
        @status = :ready
      end

      def success?
        @status == :success
      end

      def params
        upload_params = {
          file_size: reader.size,
          file_name: reader.name
        }

        upload_params[:tag] = @tag if @tag
        upload_params
      end

      def upload!
        reader.reopen

        upload_chunks(missing_parts)

        raise MissingPartError unless missing_parts.empty?

        @status = :success
      ensure
        reader.close
      end

      private

      def upload_chunks(indexes)
        indexes.each do |index|
          send_chunk(index)
        end
      end

      def session
        uploader.send(:session)
      end

      def send_chunk(index)
        range = (index * part_size...[(index + 1) * part_size, reader.size].min)

        # TODO: remove when 1.9 dropped
        unless range.respond_to?(:size)
          def range.size; self.end - self.begin + (exclude_end? ? 0 : 1); end
        end

        response = Typhoeus.put(
          session.location,
          body: reader[range],
          headers: {
            'Content-Type'     => 'application/octet-stream',
            'X-Part'           => index.to_s,
            'Content-Length'   => range.size.to_s,
            'X-Extra-File-Tag' => tag,
          }.reject { |_, v| v.nil? }
        )

        puts response.body

        uploader.send(:set_resource_id, response)
        response
      end

      def missing_parts
        upload_status['missing_parts']
      end

      def upload_status
        response = Typhoeus.get(
          session.location,
          headers: {
            'X-Extra-File-Tag' => @tag
          }.reject { |_, v| v.nil? }
        )
        JSON.parse(response.body)
      end

      def parts;           session.parts;           end
      def part_size;       session.part_size;       end
      def max_connections; session.max_connections; end
    end

    class ConcurrentFileUploadSession < FileUploadSession
      def upload_chunks(indexes)

        indexes.map do |index|
          Concurrent::Future.execute(executor: uploader.thread_pool) do
            send_chunk(index)
          end
        end.map(&:value)
      end
    end

    class UploadError < StandardError; end
    class MissingPartError < StandardError; end

    attr_reader :reader, :status, :error, :thread_pool, :concurrency

    def self.upload(options)
      retries = options.delete(:retries)
      new(options).tap { |x| x.upload(*[retries].compact) }.video
    end

    def initialize(client, options)
      @client = client

      @thread_pool = Concurrent::ThreadPoolExecutor.new(
        min_threads: 5,
        max_threads: 5,
        max_queue: 100,
        fallback_policy: :caller_runs
      )

      file = options.delete(:file) do |key|
        raise KeyError, "key not found: #{key}"
      end

      @extra_files = parse_extra_files(options.delete(:extra_files))

      @upload_session = upload_session(file)

      defaults = {
        multi_chunk: true
      }.merge(@upload_session.params)

      @params = defaults.merge(options)

      @params[:extra_files] = @extra_files.map(&:params) if @extra_files

      @status = :ready
    end

    def parse_extra_files(extra_files)
      return [] unless extra_files

      extra_files.flat_map do |tag, paths|
        paths = [paths] unless paths.kind_of?(Array)

        paths.each_with_index.map do |path, i|
          upload_session(path, paths.size > 1 ? "#{tag}.index-#{i}" : tag)
        end
      end
    end

    def upload(retries = 5)
      session

      count = 0
      begin
        count += 1
        upload!
        raise MissingPartError unless success?
      rescue StandardError => e
        puts e
        @error = e
        retry if count < retries
      end

      @resource_id
    end

    def success?
      @resource_id && @upload_session.success? && Array(@extra_files).all?(&:success?)
    end

    def upload_session(path, tag = nil)
      ConcurrentFileUploadSession.new(self, path, tag)
    end

    private

    def upload!
      @upload_session.upload!
      @extra_files.each(&:upload!)
    end

    def set_resource_id(response)
      return if response.code != 200 || response.body.empty?
      @resource_id = JSON.parse(response.body).fetch('id')
    end

    def session
      return @session if defined?(@session)
      @session = case @client.class.name
                 when "TelestreamCloud::Flip::FlipApi"
                   @factory_id ||= @params.delete(:factory_id) do |key|
                     raise KeyError, "key not found: #{key}"
                   end
                 when "TelestreamCloud::Qc::QcApi"
                   @factory_id ||= @params.delete(:factory_id) do |key|
                     raise KeyError, "key not found: #{key}"
                   end

                   @client.upload_video(@factory_id, @params)
                 end
    end
  end
end
