# Definición de Árboles
# ESTA PROHIBIDO --->
# 					Variable Global ($)
# 					Variable de Clases (@@)
# 					Variable de Instancia (@)


class ArbolBinario
	attr_accessor :value
	attr_accessor :left
	attr_accessor :right
  
	def initialize(val, left=nil, right=nil)
		@value = val
		@left = left
		@right = right
  	end

  	def each &block
  		@left.each {|node| yield node} unless @left.nil?
  		yield self
  		@right.each {|node| yield node} unless @right.nil?
  	end

  	def get
  	end

  	def set
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
  end

  def get
  end

  def set
  end
end
