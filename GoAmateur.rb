require_relative 'AbstractVideo'
class GoAmateur
  include AbstractVideo
  def get_device_class
    VIDEO
  end

  def recv_binary (message, connector)
    puts "GoAmateur is not yet active: " + message.value.to_s
  end

  def recv_string (message, connector)
    puts "GoAmateur does not understand string messages: " + message.stringMess + connector.index.to_s
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