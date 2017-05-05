module TelestreamCloud
  class ParallelUploader < Uploader
    class ThreadPool
      attr_reader :queue, :size, :worker

      def initialize(size, &block)
        @size = size
        @queue = Queue.new
        @worker = block
      end

      def <<(*args)
        queue.push(args)
      end

      def join
        size.times.map do
          Thread.new(queue) do
            begin
              while args = queue.pop(true)
                worker.call(*args)
              end
            rescue ThreadError
            end
          end
        end.map(&:join)
      end
    end

    attr_reader :concurrency

    def initialize(options)
      @concurrency = options.delete(:concurrency)
      super
    end

    def upload
      super
      files.each do |name, file|
        self.tag = name
        reset
        super
      end
    end

    private

    def upload_chunks(ids)
      ids.each { |i| thread_pool << i }
      thread_pool.join
    end

    def concurrency
      [@concurrency || max_connections, max_connections].min
    end

    def thread_pool
      @thread_pool ||= ThreadPool.new(concurrency, &method(:send_chunk))
    end
  end
end
