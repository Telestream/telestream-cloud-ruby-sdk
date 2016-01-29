module TelestreamCloud
  class Proxy
    include TelestreamCloud::Router::ClassMethods
    include TelestreamCloud::Builders::ClassMethods
    
    include TelestreamCloud::Finders::FindMany
    include TelestreamCloud::Finders::FindOne

    include TelestreamCloud::FactoryConnection

    attr_accessor :parent, :klass

    def initialize(parent, klass)
      @parent = parent
      @klass = klass
    end

    def factory
      @parent.is_a?(Factory) ? @parent : @parent.factory
    end

    def sti_name
      klass.sti_name
    end

  end
end
