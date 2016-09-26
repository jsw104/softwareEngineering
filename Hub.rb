require_relative 'AbstractDevice'
require_relative 'Connector'
require_relative 'BinaryMessage'
require_relative 'StringMessage'

class Hub
  include AbstractDevice
  def get_device_class
    HUB
  end

  def recv (message, connector)
  	raise NullPointerException, "", caller if !message || !connector
  	raise IllegalArgumentException, "", caller if connector.device.get_device_class != get_device_class
  	puts "recv not yet supported"
  end

  class HubBuilder
  	include AbstractBuilder
    def build
      validate
      raise IllegalStateException, "Hub must have atleast one computer connector and one peripheral connector.", caller unless @connector_types.include?(Connector::COMPUTER) && @connector_types.include?(Connector::PERIPHERAL)
      Hub.new(self)
    end
    private def getThis
      self
    end
  end
end