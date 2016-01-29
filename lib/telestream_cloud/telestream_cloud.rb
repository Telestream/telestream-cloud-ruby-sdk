module TelestreamCloud

  extend self
  extend Forwardable

  attr_reader :factory, :factories
  attr_reader :connection

  def_delegators :connection, :get, :post, :put, :delete, :api_url, :setup_bucket, :signed_params

  RESOURCES = {
    flip: TelestreamCloud::Flip
  }

  def configure(auth_params=nil, &block)
    raise ArgumentError, "missing auth params or block" unless auth_params || block_given?

    if !auth_params
      config = Config.new
      if (block.arity > 0)
        block.call(config)
      else
        config.instance_eval(&block)
      end
    elsif auth_params.is_a?(String)
      config = Config.from_panda_url(auth_params)
    else
      config = Config.from_hash(auth_params)
    end

    configure_with_auth_params(config)
    true
  end

  def configure_heroku
    configure_with_auth_params Config.from_panda_url(ENV['PANDASTREAM_URL'])
    true
  end

  def connect!(auth_params)
    @connection = Connection.new(auth_params)
  end

  def connection
    raise TelestreamCloud::ConfigurationError, "Telestream Cloud is not configured!" unless @connection
    @connection
  end

  def default_adapter=(adapter_name)
    @adapter = adapter_name.to_sym
  end

  def default_adapter
    @adapter
  end

  def resources(resource_name)
    RESOURCES[resource_name].new
  end
  
  private

  def configure_with_auth_params(config)
    config.validate!
    connect!(config.to_hash)
    @factories = {}
    @factory = Factory::new(:id => @connection.factory_id)
  end
end
