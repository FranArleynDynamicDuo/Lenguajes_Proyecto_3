# Definición de Árboles
# ESTA PROHIBIDO --->
# 					Variable Global ($)
# 					Variable de Clases (@@)
# 					Variable de Instancia (@)

require './mod_bfs'
require './mod_fold'

class ArbolBinario < include Bfs,Dfs
	attr_accessor :value
	attr_accessor :left
	attr_accessor :right
  
	def initialize(val, left=nil, right=nil)
		@value = val
		@left = left
		@right = right
  	end

  	def each
      unless @left.nil?
        yield @left
      end
      unless @right.nil?
        yield @right
      end
  	end
end

	
class ArbolRosa < include Bfs,Dfs
  attr_accessor :value
  attr_accessor :array

  def initialize(val, *sons)
      @value = val
      @array = sons
  end

  def each &block
    @array.each do |element|
      unless element.nil?
        yield element
      end
    end
  end

end

########################### PRUEBAS ###########################

puts 'ARBOL BINARIO'
puts ''
puts 'Probando Constructores'
f = ArbolBinario.new(7,nil,nil)
y = ArbolBinario.new(2,f,nil)
w = ArbolBinario.new(11,nil,nil)
z = ArbolBinario.new(10,w,nil)
x = ArbolBinario.new(5,y,z)

puts x
puts ''

puts 'Probando Iterador'
x.each do |child|
  print child.value
  print " "
end
puts ''
puts ''

puts 'Probando bfs sin bloque'
x.bfs
puts ''

puts 'Probando bfs con bloque'
x.bfs {|n| print "#{n.value} "}
puts ''
puts ''

puts 'Probando recoger'
respuestaRecoger = x.recoger {|n| next n.value == 5 || n.value == 10 || n.value == 11}
puts 'Imprimiendo respuestaRecoger'
respuestaRecoger.each do |element|
  print element.value
  print " "
end
puts ''
puts ''
  
puts 'Probando dfs con bloque'
x.dfs {|n| print "#{n.value} "}
puts ''
puts ''

puts 'Probando fold con bloque'
result = x.fold(0) {|n,acum| next (acum + n.value)}
puts "result =  #{result}" 
puts ''