class Main
	require 'thread'
	require './lib/naranjero/base'

	attr_accessor :naranjero
	def initialize(naranjero)
		@mutex = Mutex.new
		@cv = ConditionVariable.new
		@naranjero = naranjero
	end

	def getOranges
		op = Thread.new do 
		until (!@naranjero.estaVivo)
			sleeping = rand(0..4)
			print "\e[#{31}m#{"Orange Picker going to sleep for #{sleeping}\n"}\e[0m"
			sleep(sleeping)
			print "\e[#{31}m#{"Orange Picker woke up after sleeping for #{sleeping}\n"}\e[0m"
			@mutex.synchronize do
				print "\e[#{32}m#{@naranjero.recolectar_una}\e[0m"
				print "\e[#{31}m#{"Orange picker waiting patiently...\n"}\e[0m"			
				if @naranjero.estaVivo
					@cv.wait(@mutex) 
				end
			end
		end	
		end
	
		ageUP = Thread.new do 
		until(!@naranjero.estaVivo)
			sleeping = rand(0..4)
			print "\e[#{31}m#{"AgeUP going to sleep for #{sleeping}\n"}\e[0m"
			sleep(sleeping)
			print "\e[#{31}m#{"AgeUP woke up after sleeping for #{sleeping}\n"}\e[0m"
			@mutex.synchronize do
				print "\e[#{32}m#{@naranjero.uno_mas}\e[0m"
				@cv.signal
			end
		end
		end
		[op,ageUP]
	end
end
if __FILE__ == $0
	main = Main.new(Naranjero.new)
	threads = main.getOranges
	threads.each {|th| th.join}
end
