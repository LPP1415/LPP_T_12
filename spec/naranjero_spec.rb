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
		it "Primera llamada()" do
			@naranjo.uno_mas
			expect(@naranjo.altura) == 0.4
			expect(@naranjo.edad) == 0.4
		end
		it "esta vivo" do
			expect(@naranjo.estaVivo) == true
		end
		
	end
	describe "Metodo recoletar_una" do
		it "Segunda llamada(recolectar_una)" do
			expect(@naranjo.recolectar_una) == 'No hay naranjas'
			
		end
	end
	describe "esta muerto "do
		it "esta muerto " do 
			40.times do
				@naranjo.uno_mas
			end
			expect(@naranjo.estaVivo) == false
		end
	end
end

