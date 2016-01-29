module TelestreamCloud
  
  class Error < StandardError; end
  
  class APIError < TelestreamCloud::Error
    def initialize(options)
      super("#{options['error']}: #{options['message']}")
    end
  end

  class ServiceNotAvailable < TelestreamCloud::Error
  end

  class ConfigurationError < TelestreamCloud::Error
  end

end
