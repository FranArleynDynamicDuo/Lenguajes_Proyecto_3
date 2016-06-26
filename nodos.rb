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

# FALTA PREGUNTAR SOBRE EL REDONDEO
class Fixnum < Mutador

	def Singular(num)
		
		# Se redonde el numero
		num = redondeo(num)
		# Se parsea el digito y se convierte en un arreglo
		num2 = num.to_s.split("").map(&:to_i)
		# Se inicializa la variable sum (contener el calculo de los digitos)
		sum = 0
		# Se inicializa la variable sum (contener el calculo de los digitos)
		length = num2.length

		# Se verifica que el numero tenga mas de un digito
		if length > 1
			# Se itera en el arreglo
			num2.each do |x|
				# Si no es el ultimo valor del arreglo, se suman cada
				# uno de sus digitos
				if (num2.index x).to_i + 1 != length.to_i
					sum = sum + x	
				# Si es el ultimo valor del arreglo se multiplica
				# con la sumatoria calculada anteriormente
				elsif (num2.index x).to_i + 1 == length.to_i
					sum = sum*x
				end
			end
			puts sum
			return sum
		else 
			puts num
			return num
		end
	end


	# Verificar si el promedio puede ser un real o tambien
	# hay que redondear ==> sum / lenght or sum.to_f / lenght
	def Uniforme(num)
		
		# Se redonde el numero
		num = redondeo(num)
		# Se parsea el digito y se convierte en un arreglo
		num2 = num.to_s.split("").map(&:to_i)
		# Se inicializa la variable sum (contener el calculo de los digitos)
		sum = 0
		# Se inicializa la variable sum (contener el calculo de los digitos)
		length = num2.length

		# Se verifica que el numero tenga mas de un digito
		if length > 1
			# Se itera en el arreglo se suman cada
			# uno de sus digitos
			num2.each do |x|
				sum = sum + x	
			end
			# Se calcula el promedio
			sum = sum.to_f /  length
			# Se redonde el resultado en dado caso que
			# que sea necesario
			sum = redondeo(sum)
			puts sum
			return sum
		else 
			puts num
			return num
		end
	end

	def Oscuro
	end
end

class String < Mutador

	def Singular(word)
		# Se sustituye las letras que contienen la palabra
		# "singular" en mayusculas
		word.gsub!(/s/, "S")
		word.gsub!(/i/, "I")
		word.gsub!(/n/, "N")
		word.gsub!(/g/, "G")
		word.gsub!(/u/, "U")
		word.gsub!(/l/, "L")
		word.gsub!(/a/, "A")
		word.gsub!(/r/, "R")
		puts word
		# retorna la palabra con las sustituciones
		# corrrespondientes
		return word
	end

	def Uniforme(word)
		# Se convierte la palabra en un arreglo
		word = word.split("")
		# Se itera en el arreglo que contiene todas
		# las letras de la palabra, si el index del arreglo
		# es par se cambia la letra a mayuscula y si el
		# index es impar se convierte en minuscula
		word.each do |x|
			if (word.index x).to_i % 2 == 0 
				x.upcase!
			else
				x.downcase!
			end
		end
		# Se convierte el arreglo en un string
		result = word.join
		puts result
		# Retornamos la palabra
		return result
	end

	def Oscuro(word)
		# Se inicializa el ArregloDerecho
		arrRight = []
		# Se inicializa el Arreglo Izquierdo
		arrLeft = []
		# Se convierte la palabra en un arreglo
		word = word.split("")
		# Se itera en el arreglo
		word.each do |x|

			# Si el index del arreglo es par se guarda
			# en el arreglo derecho
			if (word.index x).to_i % 2 == 0 
				arrRight.push(x)
			# Si el index del arreglo es impar se guarda
			# en el arreglo derecho
			else
				arrLeft.push(x)
			end
		end
		# Se convierte el arreglo derecho e izquiero en string
		wordRight = arrRight.join
		wordLeft = arrLeft.join
		# Se concatenan los string
		wordAll = wordLeft << wordRight
		puts wordAll
		# Se retorna la palabra
		return wordAll
	end
end

class Array < Mutador

	def Singular(word)
		# Se aplana el arreglo
		word.flatten! 
		# Se inicializa la variable
		arrWord = []
		# Se calcula el tamaño del arreglo
		length = word.length
		# Se itera en el arreglo
		word.each do |x|
			# Se guarda cada valor en el arreglo
			# inicializado
			arrWord.push(x)
			# Se agrega un espacio cada vez que se agrege una
			# palabra al arreglo, menos al ultimo valor 
			if (word.index x).to_i + 1 != length.to_i
				arrWord.push(" ")
			end
		end
		# Transformamos el arreglo en un String
		result = arrWord.join
		puts result
		# Retornamos la palabra
		return result
	end

	def Uniforme
	end

	def Oscuro
	end
end


def redondeo (x)
	valorEntero = Integer(x)
	if (x - valorEntero >= 0.5)
    	return valorEntero + 1
	else
   		return valorEntero
	end
end

