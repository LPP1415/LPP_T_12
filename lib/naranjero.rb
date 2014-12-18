require './lib/naranjero/version'

class Naranjero
	require 'thread'
	attr_accessor :altura, :edad, :contador, :estaVivo
	def initialize
		@altura = 0
		@edad = 0
		@contador = 0 
		@estaVivo = true
	end

	def uno_mas
		if @estaVivo 
			@edad = @edad + 1
			@altura = @altura + 0.4
			
			if @altura > 10 && rand(2) > 0 	#Si se cumple esta condicion el arbol muere
				@estaVivo = false
				"Oh, no! El arbol es muy viejo y ha muerto :( \n"
			elsif @altura > 2 	#Si se cumple esta condicion el arbol dara frutos
				@contador = (@altura * 15 - 25).to_i
				"Este año tu arbol mide #{@altura.round(2)}"+
				" y ha producido #{@contador} naranjas \n"
			else
				"Este año tu arbol mide #{@altura.round(2)}"+
				" y es demasiado jover para dar frutos \n"
			end
		else
				"Un año despues, el arbol sigue muerto :( \n"
		end
	end

	def recolectar_una
		if @estaVivo
			if @contador > 0
				@contador = @contador - 1
				"Recoges una jugosa y deliciosa naranja \n"
			else
				"No hay naranjas \n"
			end
		else 
				"El arbol esta muerto :( \n"
		end
	end
end

if __FILE__ == $0 
	ot = Naranjero.new
	ageUp = Thread.new{loop{puts(ot.uno_mas);sleep 1.0}}
	getOranges = Thread.new{loop{puts(ot.recolectar_una);sleep 2.0}}
	getOranges.value
end
