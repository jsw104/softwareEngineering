require_relative 'AbstractDevice'
module AbstractPeripheral
  include AbstractDevice

end

module AbstractPeripheralBuilder
  include AbstractBuilder
  def validate
    raise NullPointerException, "Device must have version number.", caller if @version.nil?
    raise InvalidPeripheralException, "Peripheral may only have connectors with type: Peripheral", caller if @connector_types.include?(Connector::COMPUTER)
  end
end