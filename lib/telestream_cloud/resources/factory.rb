module TelestreamCloud
  class Factory < Base
    include TelestreamCloud::Updatable
    
    attr_reader :connection

    def initialize(attributes={})
      super(attributes)
      connection_params = TelestreamCloud.connection.to_hash.merge!(:factory_id => id)
      @connection = Connection.new(connection_params)
      TelestreamCloud.factories[id] = self
    end

    class << self

      def connection
        TelestreamCloud.connection
      end
      
      private

      def build_resource(attributes)
        resource = TelestreamCloud::Factory.new(attributes)
      end
    end

    def https_url
      uri = URI.parse(url)
      uri.scheme = "https"
      uri.to_s
    end

    def eu?
      region == "eu"
    end

    def us?
      region == "us"
    end

    def region
      return 'eu' if connection.api_host == TelestreamCloud::EU_API_HOST
      return 'us' if connection.api_host == TelestreamCloud::US_API_HOST
      return 'gce' if connection.api_host == TelestreamCloud::GCE_API_HOST
    end

    def videos
      VideoScope.new(self)
    end

    def encodings
      EncodingScope.new(self)
    end

    def profiles
      ProfileScope.new(self)
    end

    def method_missing(method_symbol, *arguments)
      lazy_load
      super
    end

    private 
    
    def lazy_load
      reload unless @loaded
    end

  end
end

