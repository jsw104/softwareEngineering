require_relative 'AbstractPeripheral'
class SisterPrinter
  include AbstractPeripheral
  def get_device_class
    PRINTER
  end

  def recv_binary (message, connector)
    puts "Sister Printer has printed the binary message: " + (message.value + self.product_code).to_s
  end

  def recv_string (message, connector)
    puts "Sister Printer has printed the string: " + message.stringMess + self.serial_number.to_s
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