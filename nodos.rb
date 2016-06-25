# Definición de los nodos y mutadores

class Node
	attr_reader :x, :y

	def initialize x, y
		# ...
	end

	def visitado_por v
		# ...
	end

	def to_s
		# ...
	end
end

class Mutador

end

class Fixnum < Mutador

	def Singular(word)
		
	end

	def Uniforme
	end

	def Oscuro
	end
end

class String < Mutador

	def Singular(word)
		palabra.gsub!(/s/, "S")
		palabra.gsub!(/i/, "I")
		palabra.gsub!(/n/, "N")
		palabra.gsub!(/g/, "G")
		palabra.gsub!(/u/, "U")
		palabra.gsub!(/l/, "L")
		palabra.gsub!(/a/, "A")
		palabra.gsub!(/r/, "R")
		puts palabra
	end

	def Uniforme(word)
		word = word.split("")
		word.each do |x|
			if (word.index x).to_i % 2 == 0 
				x.upcase!
			else
				x.downcase!
			end
		end
		result = word.join
		puts word
	end

	def Oscuro(word)
		arrRight = []
		arrLeft = []
		word.each do |x|

			if (word.index x).to_i % 2 == 0 
				arrRight.push(x)
			else
				arrLeft.push(x)
			end
		end
		wordRight = arrRight.join
		wordLeft = arrLeft.join
		wordAll = wordLeft << wordRight
		puts wordAll
	end
end

class Array < Mutador

	def Singular
		word  = [ "Me", ["He comido",4], [["Mangos"]] ]
		word.flatten! 
		arrWord = []
		length = word.length

		word.each do |x|
			arrWord.push(x) 
			if (word.index x).to_i + 1 != length.to_i
				arrWord.push(" ")
			end
		end
		result = arrWord.join
		puts result
	end

	def Uniforme
	end

	def Oscuro
	end
end
