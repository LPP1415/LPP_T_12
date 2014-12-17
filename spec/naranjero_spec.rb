require './lib/naranjero/base'

describe Naranjero do
	before :each do
		@naranjo = Naranjero.new	      
	end
	describe "Constructor" do
    		it "Se inicializa correctamente" do
			expect(@naranjo.altura) == 0
			expect(@naranjo.edad) == 0
			expect(@naranjo.contador) == 0
			expect(@naranjo.estaVivo) == true
        	end
	end
	describe "Metodo uno_mas" do
		it "Primera llamada" do
			x = @naranjo.uno_mas
			expect(@naranjo.altura) == 0.4
			expect(@naranjo.edad) == 0.4
		end
	end
end

