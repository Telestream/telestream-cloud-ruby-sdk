module TelestreamCloud
  class Resource < Base
    include TelestreamCloud::Destroyers
    include TelestreamCloud::Associations
    include TelestreamCloud::FactoryConnection

    def initialize(attributes={})
      super(attributes)
      @attributes['factory_id'] ||= TelestreamCloud.factory.id
    end

    class << self
      include TelestreamCloud::FactoryConnection

      def factory
        TelestreamCloud.factory
      end

      # delegate to the scope if the method exists
      def method_missing(method_symbol, *args, &block)
        scope = TelestreamCloud::const_get("#{sti_name}Scope").new(self)
        if scope.respond_to?(method_symbol)
           scope.send(method_symbol, *args, &block)
        else
          super
        end
      end

    end

    def factory
      TelestreamCloud.factories[factory_id]
    end

    def reload
      perform_reload("factory_id" => factory_id)
      reset_associations
      self
    end

    private

    def load_and_reset(response)
      load_response(response.merge('factory_id' => factory.id))
    end

  end
end
