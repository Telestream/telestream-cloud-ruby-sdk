module TelestreamCloud
  class UploadSession
    attr_reader :uploader

    def initialize(file_name, options = {})
      @uploader = Uploader.new(options.merge(file: File.new(file_name)))
    end

    def error_message
      uploader.error && uploader.error.message
    end

    def start(_ = nil)
      uploader.upload
    end

    def status
      uploader.status.to_s
    end

    def resume
      start
    end

    def video
      uploader.video
    end

    def file_name
      uploader.reader.name
    end

    def file_size
      uploader.reader.size
    end

    def abort
    end
  end
end
