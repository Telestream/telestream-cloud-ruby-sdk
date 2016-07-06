module TelestreamCloud
  class Uploader
    class FileReader
      attr_reader :file

      def initialize(file)
        @file = file
        @mutex = Mutex.new
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
    end
  end
end
