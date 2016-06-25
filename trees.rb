# Definición de Árboles
# ESTA PROHIBIDO --->
# 					Variable Global ($)
# 					Variable de Clases (@@)
# 					Variable de Instancia (@)

require 'mod_bfs'

class ArbolBinario < include Bfs
	attr_accessor :value
	attr_accessor :left
	attr_accessor :right
  
	def initialize(val, left=nil, right=nil)
		@value = val
		@left = left
		@right = right
  	end

  	def each &block
  		yield @left
  		yield @right
  	end
end

	
class ArbolRosa
  attr_accessor :value
  attr_accessor :array

  def initialize(val, *sons)
      @value = val
      @array = sons
  end

  def each &block
    @array.each do |element|
       yield element
    end
  end

end
puts 'ARBOL BINARIO'
puts ''
puts 'Probando Constructores'
y = ArbolBinario.new(2,nil,nil)
z = ArbolBinario.new(10,nil,nil)
x = ArbolBinario.new(5,y,z)

puts x
puts ''

puts 'Probando Iterador'
x.each do |child|
  puts child.value
end
puts ''

puts 'Probando bfs sin bloque'
x.bfs
puts ''

puts 'Probando bfs con bloque'
x.bfs {|n| puts "Number #{n.value}"}
puts ''