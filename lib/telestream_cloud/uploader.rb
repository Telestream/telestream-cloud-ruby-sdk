require 'pathname'
require 'json'

module TelestreamCloud
  class Uploader
    class UploadError < StandardError; end
    class MissingPartError < StandardError; end

    attr_reader :video, :status, :error, :tag
    attr_writer :tag

    def self.upload(options)
      retries = options.delete(:retries)
      new(options).tap { |x| x.upload(*[retries].compact) }.video
    end

    def initialize(options)
      file = options.delete(:file) { |key| fail KeyError, "key not found: #{key}" }
      @tag = ""
      @reader = FileReader.new(file)
      extra_files = options.delete(:extra_files)

      defaults = {
        signature_version: '2',
        file_size: @reader.size,
        file_name: @reader.name,
        multi_chunk: true,
        extra_files: [],
      }
      @files = {}

      extra_files.each do |key, ef|
        if ef.is_a?(Array)
          i = 0
          ef.each { |file|
            defaults[:extra_files] << add_file("#{key}.index-#{i}", file)
            i+=1
          }
        else
          defaults[:extra_files] << add_file(key, ef)
        end
      end if extra_files

      @params = defaults.merge(options)
      @status = :ready
    end

    def files
      @files
    end

    def add_file(key, file)
      file_reader = FileReader.new(file)
      files[key] = file_reader

      {
        tag: key,
        file_size: file_reader.size,
        file_name: file_reader.name,
      }
    end

    def upload(retries = 5)
      count = 0
      begin
        count += 1
        upload!
        fail MissingPartError unless success?
      rescue => e
        @error = e
        retry if count < retries
        self.status = :failed
      end

      success?
    end

    def success?
      status == :success
    end

    private

    def upload!
      self.status = :uploading
      upload_chunks(missing_parts)
    end

    def upload_chunks(ids)
      ids.each(&method(:send_chunk))
    end

    def missing_parts
      return (0...parts).to_a unless @session
      upload_status['missing_parts']
    end

    def send_chunk(index)
      range = (index * part_size...[(index + 1) * part_size, reader.size].min)

      # TODO: remove when 1.9 dropped
      unless range.respond_to?(:size)
        def range.size; self.end - self.begin + (exclude_end? ? 0 : 1); end
      end

      response = http.put do |request|
        request.headers['Content-Type'] = 'application/octet-stream'
        request.headers['X-Part'] = "#{index}"
        request.headers['X-Extra-File-Tag'] = tag
        request.headers['Content-Length'] = "#{range.size}"
        request.body = reader[range]
      end

      set_video(response)
      response
    end

    def set_video(response)
      return if response.status != 200 || response.body.empty?
      @video = Video.new(JSON.parse(response.body))
      self.status = :success
    end

    def status=(status)
      @status = status
      @error = nil if success?
      @status
    end

    def http
      @http ||= ::Faraday.new(url: URI(session['location'])) do |builder|
        builder.request :multipart
        builder.request :url_encoded
        builder.adapter TelestreamCloud.default_adapter
        builder.headers['X-Extra-File-Tag'] = tag
      end
    end

    def upload_status
      JSON.parse(http.get.body)
    end

    def parts;           session['parts'].to_i;           end
    def part_size;       session['part_size'].to_i;       end
    def max_connections; session['max_connections'].to_i; end

    def session
      @session ||= TelestreamCloud.post('/videos/upload.json', @params)

      if !@session || @session['error']
        fail UploadError, @session && @session.values_at('error', 'message')
      end

      @session
    end

    def reset
      @http = nil
      @status = :ready
    end
    def reader
      if tag == ""
        @reader
      else
        files[tag]
      end
    end
  end
end
