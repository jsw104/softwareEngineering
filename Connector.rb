class Connector
  TYPE = [COMPUTER = 0, PERIPHERAL  = 1]

  attr_reader :device, :index, :type
  attr_accessor :peer
  def initialize (device, index, type)
    @device = device
    @index = index
    @type = type
    @peer = nil
  end
end
