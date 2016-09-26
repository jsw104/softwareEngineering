require_relative 'AbstractPeripheral'
class SisterPrinter
  include AbstractPeripheral
  def get_device_class
    PRINTER
  end

  def recv (message, connector)
  	raise NullPointerException, "", caller if !message || !connector
  	raise IllegalArgumentException, "", caller if connector.device.get_device_class != get_device_class
  	puts "Sister Printer has printed the string: " + message.stringMess + self.serial_number.to_s if message.is_a?(StringMessage)
  	puts "Sister Printer has printed the binary message: " + (message.value + self.product_code).to_s if message.is_a?(BinaryMessage)
  end
  class SisterPrinterBuilder
  	include AbstractPeripheralBuilder
  	def build
      validate
      SisterPrinter.new(self)
    end
    private def getThis
      self
    end
  end
end