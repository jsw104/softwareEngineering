require_relative 'AbstractPeripheral'
class CannonPrinter
  include AbstractPeripheral
  def get_device_class
    PRINTER
  end

  def recv (message, connector)
  	raise NullPointerException, "", caller if !message || !connector
  	raise IllegalArgumentException, "", caller if connector.device.get_device_class != get_device_class
  	puts "Cannon Printer has printed the string: " + message.stringMess + self.version.to_s if message.is_a?(StringMessage)
  	puts "Cannon Printer has printed the binary message: " + (message.value * self.serial_number).to_s if message.is_a?(BinaryMessage)
  end
  class CannonPrinterBuilder
  	include AbstractPeripheralBuilder
  	def build
      validate
      CannonPrinter.new(self)
    end
    private def getThis
      self
    end
  end
end