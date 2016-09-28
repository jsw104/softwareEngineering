require_relative 'AbstractPeripheral'
class CannonPrinter
  include AbstractPeripheral
  def get_device_class
    PRINTER
  end

  def recv_binary (message, connector)
    puts "Cannon Printer has printed the binary message: " + (message.value * self.serial_number).to_s
  end

  def recv_string (message, connector)
    puts "Cannon Printer has printed the string: " + message.stringMess + self.version.to_s
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