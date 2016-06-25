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

# FALTA VERIFICAR QUE OCURRA SI EL DIGITO ES MAYOR QUE 10
class Fixnum < Mutador

	def Singular(num)
		
		num2 = num.to_s.split("").map(&:to_i)
		sum = 0
		length = num2.length

		if length > 1
			num2.each do |x|
				if (num2.index x).to_i + 1 != length.to_i
					sum = sum + x	
				elsif (num2.index x).to_i + 1 == length.to_i
					sum = sum*x
				end
			end
		end
	end


	# Verificar si el promedio puede ser un real o tambien
	# hay que redondear ==> sum / lenght or sum.to_f / lenght
	def Uniforme(num)
		
		num2 = num.to_s.split("").map(&:to_i)
		sum = 0
		length = num2.length

		if length > 1
			num2.each do |x|
				sum = sum + x	
			end
			sum = sum / length
			sum.ceil!
		end
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
