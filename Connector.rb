require 'Forwardable'
class Connector
  extend Forwardable
  TYPE = [COMPUTER = 0, PERIPHERAL  = 1]
  ERROR_CODE = [CONNECTOR_BUSY = 0, CONNECTOR_MISMATCH = 1, CONNECTION_CYCLE = 2]

  attr_reader :device, :index, :type
  attr_accessor :peer
  def initialize (device, index, type)
    @device = device
    @index = index
    @type = type
    @peer = nil
  end

  def set_peer (peer)
  	raise NullPointerException, "Device must have version number.", caller if @peer.nil?
  	raise ConnectionException, CONNECTOR_BUSY, caller if @peer
  	raise ConnectionException, CONNECTOR_MISMATCH, caller if (peer.type == @type)
  	raise ConnectionException, CONNECTION_CYCLE, caller if (peer.is_reachable(@device))
  	@peer = peer
  end

  def_delegator :@device, :is_reachable
end
