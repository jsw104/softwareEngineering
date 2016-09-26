require_relative 'Message'
class StringMessage
  include Message
  attr_reader :stringMess
  def initialize (string)
    @stringMess = string ? string : ""
    freeze
  end

  def equals(object)
    object && object.is_a?(StringMessage) && @stringMess.eql?(object.stringMess)
  end

  def getThis
  	self
  end

  #def_delegator
end