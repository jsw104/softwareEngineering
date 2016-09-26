module Message
	def reach (device, connector)
	  device.recv(getThis, connector) if getThis.is_a?(BinaryMessage) || getThis.is_a?(StringMessage)
	end

	def recv (message)

	end
end