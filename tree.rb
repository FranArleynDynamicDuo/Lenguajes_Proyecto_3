# Definición de Árboles


module ArbolBinario

	class Node
    attr_accessor :value
    attr_accessor :left
    attr_accessor :right
	end

	def inicializar val, left, right
		@value = val
		@left = left
		@right = right

	end
end

module ArbolRosa

	class Node
    attr_accessor :value
	end
end
