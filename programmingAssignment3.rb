require_relative 'Connector'
require_relative 'BinaryMessage'
require_relative 'StringMessage'
require_relative 'AbstractDevice'
require_relative 'Hub'
require_relative 'GoAmateur'
require_relative 'SisterPrinter'
require_relative 'CannonPrinter'

#put everything in one module

#delegator methods on StringMessage

test = StringMessage.new("testing")
puts test.length

#product code could be nil
puts "creating hub builder"
builder = Hub::HubBuilder.new(1)
builder.set_product_code(2)
builder.set_serial_number(3)
builder.set_connectors([Connector::COMPUTER, Connector::COMPUTER, Connector::PERIPHERAL])

puts "building hub"
hub = builder.build

puts "creating goAmateur builder"
builder = GoAmateur::GoAmateurBuilder.new(4)
builder.set_product_code(5)
builder.set_serial_number(6)
builder.set_connectors([Connector::PERIPHERAL, Connector::PERIPHERAL, Connector::PERIPHERAL])

puts "building GoAmateur"
goAmateur = builder.build

puts "creating Sister Printer builder"
builder = SisterPrinter::SisterPrinterBuilder.new(7)
builder.set_product_code(8)
builder.set_serial_number(9)
builder.set_connectors([Connector::PERIPHERAL, Connector::PERIPHERAL, Connector::PERIPHERAL])

puts "building SisterPrinter"
sisterPrinter = builder.build

puts "creating Cannon Printer builder"
builder = CannonPrinter::CannonPrinterBuilder.new(10)
builder.set_product_code(11)
builder.set_serial_number(12)
builder.set_connectors([Connector::PERIPHERAL, Connector::PERIPHERAL, Connector::PERIPHERAL])

puts "building SisterPrinter"
cannonPrinter = builder.build

puts "creating Messages"
bm = BinaryMessage.new(13)
sm = StringMessage.new("hello")

puts "creating arrays"
deviceArray = [hub, goAmateur, sisterPrinter, cannonPrinter]
messageArray = [bm, sm]

#deviceArray.each do |device|
for device in deviceArray
	for message in messageArray
		message.reach(device, device.get_connector(0))
	end
end

