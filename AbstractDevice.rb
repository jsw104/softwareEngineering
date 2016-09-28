module AbstractDevice
  attr_reader :product_code, :serial_number, :version, :device_class 
  DEVICE_CLASS = [UNSPECIFIED = 0, AUDIO = 1, COMM = 2, HID = 3, PID = 4, IMAGE = 5, PRINTER = 6, STORAGE = 7, VIDEO = 8, AV = 9, VR = 10, HUB = 11]
  
  def get_connector_count
    @connectors.count
  end

  def get_connectors
    @connectors
  end

  def get_connector (i)
    @connectors[i]
  end 

  def recv(message, connector)
    raise NullPointerException, "", caller if !message || !connector
    raise IllegalArgumentException, "", caller if connector.device.get_device_class != get_device_class
    recv_string(message, connector) if message.is_a?(StringMessage)
    recv_binary(message, connector) if message.is_a?(BinaryMessage)
  end

  private def initialize (builder)
  #super initialize, put these 4 lines in abstract device
    @version = builder.version
    @product_code = builder.product_code
    @serial_number = builder.serial_number
    @connectors = builder.connector_types.map.with_index {|connector_type, index| Connector.new(self, index, connector_type)}
  end
end

module AbstractBuilder
  attr_reader :version, :product_code, :serial_number, :connector_types
  def initialize(version)
    @version = version
  end

  def set_product_code(product_code)
    @product_code = product_code
    getThis
  end

  def set_serial_number (serial_number)
    @serial_number = serial_number
    getThis
  end

  def set_connectors (connector_types)
    @connector_types = connector_types.clone
    getThis
  end

  def get_connectors
    @connector_types
  end

  def validate
    raise NullPointerException, "Device must have version number.", caller if @version.nil?
  end

  private :get_connectors, :validate
end
