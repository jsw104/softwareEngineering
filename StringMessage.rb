require_relative 'Message'
require 'Forwardable'
class StringMessage
  include Message
  extend Forwardable
  
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

  def_delegator :@stringMess, :length
  #def_delegator :@stringMess[i], :char_at(i)


  #def_delegator
  #length, charAt,
#contains(CharSequence), endsWith, startsWith(String),
#indexOf (all methods), lastIndexOf (all methods), isEmpty,
#and hashCode
end