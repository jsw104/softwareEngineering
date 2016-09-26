require_relative 'AbstractVideo'
class GoAmateur
  include AbstractVideo
  def get_device_class
    VIDEO
  end

  def recv (message, connector)
    raise NullPointerException, "", caller if !message || !connector
    raise IllegalArgumentException, "", caller if connector.device.get_device_class != get_device_class
    puts "GoAmateur does not understand string messages: " + message.stringMess + connector.index.to_s if message.is_a?(StringMessage)
    puts "GoAmateur is not yet active: " + message.value.to_s if message.is_a?(BinaryMessage)
  end
  class GoAmateurBuilder
  	include AbstractVideoBuilder
  	def build
      validate
      GoAmateur.new(self)
    end
    private def getThis
      self
    end
  end
end