# Definición de Árboles
# ESTA PROHIBIDO --->
# 					Variable Global ($)
# 					Variable de Clases (@@)
# 					Variable de Instancia (@)

require './mod_bfs'
require './mod_fold'
require './nodos'

class ArbolBinario < include Bfs,Dfs
	attr_accessor :valor
	attr_accessor :left
	attr_accessor :right
  
	def initialize(val, left=nil, right=nil)
		@valor = val
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
  	
  def mutar (mutador)
    @valor = @valor.receive(mutador.new())
  end
  
end

	
class ArbolRosa < include Bfs,Dfs
  attr_accessor :valor
  attr_accessor :array

  def initialize(val, *sons)
      @valor = val
      @array = sons
  end

  def each &block
    @array.each do |element|
      unless element.nil?
        yield element
      end
    end
  end
  
  def mutar (mutador)
    @valor = @valor.receive(mutador.new())
  end

end

#
############################ PRUEBAS ###########################
#
#puts 'ARBOL BINARIO'
#
#a = ArbolBinario.new( 10 ) # Instancio la clase valor 5 y no tiene hijos
#a.valor.receive(Singular.new())
#puts a.valor
#
############################ PRUEBAS ###########################
#
#puts 'ARBOL BINARIO'
#puts ''
#puts 'Probando Constructores'
#f = ArbolBinario.new(7,nil,nil)
#y = ArbolBinario.new(2,f,nil)
#w = ArbolBinario.new(11,nil,nil)
#z = ArbolBinario.new(10,w,nil)
#x = ArbolBinario.new(5,y,z)
#
#puts x
#puts ''
#
#puts 'Probando Iterador'
#x.each do |child|
#  print child.valor
#  print " "
#end
#puts ''
#puts ''
#
#puts 'Probando bfs sin bloque'
#x.bfs
#puts ''
#
#puts 'Probando bfs con bloque'
#x.bfs {|n| print "#{n.valor} "}
#puts ''
#puts ''
#
#puts 'Probando recoger'
#respuestaRecoger = x.recoger {|n| next n.valor == 5 || n.valor == 10 || n.valor == 11}
#puts 'Imprimiendo respuestaRecoger'
#respuestaRecoger.each do |element|
#  print element.valor
#  print " "
#end
#puts ''
#puts ''
#  
#puts 'Probando dfs con bloque'
#x.dfs {|n| print "#{n.valor} "}
#puts ''
#puts ''
#
#puts 'Probando fold con bloque'
#result = x.fold(0) {|n,acum| next (acum + n.valor)}
#puts "result =  #{result}" 
#puts ''
