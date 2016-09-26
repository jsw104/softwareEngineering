require_relative 'Message'
class BinaryMessage
  include Message
  attr_reader :value
  def initialize (value)
    @value = value ? value : 0
  end

  def equals(object)
    object && object.is_a?(BinaryMessage) && @value == object.value
  end

  def getThis
  	self
  end
end