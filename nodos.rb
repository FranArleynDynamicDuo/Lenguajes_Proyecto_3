# Definición de los nodos y mutadores

class Mutador; end


class Singular < Mutador

	def isFixnum(num)
		# Se parsea el digito y se convierte en un arreglo
		num2 = num.to_s.split("").map(&:to_i)
		# Se inicializa la variable i y sum (contener el calculo de los digitos)
		sum = 0
		i = 0
		# Se calcula el tamaño del arreglo
		length = num2.length

		# Se verifica que el numero tenga mas de un digito
		if length > 1
			# Se itera en el arreglo
			num2.each do |x|
				# Si no es el ultimo valor del arreglo, se suman cada
				# uno de sus digitos
				if i + 1 != length.to_i
					sum = sum + x	
				# Si es el ultimo valor del arreglo se multiplica
				# con la sumatoria calculada anteriormente
				elsif i + 1 == length.to_i
					sum = sum*x
				end
				i += 1
			end
			puts sum
			return sum
		else 
			puts num
			return num
		end
	end

	def isString(word)
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

	def isArray(arr)
		# Se aplana el arreglo
		arr.flatten! 
		# Se inicializa la variable
		arrWord = []
		i = 0
		# Se calcula el tamaño del arreglo
		length = arr.length
		# Se itera en el arreglo
		arr.each do |x|
			# Se guarda cada valor en el arreglo
			# inicializado
			arrWord.push(x)
			# Se agrega un espacio cada vez que se agrege una
			# palabra al arreglo, menos al ultimo valor 
			if i + 1 != length.to_i
				arrWord.push(" ")
			end
			i += 1
		end
		# Transformamos el arreglo en un String
		arrWord = arrWord.join
		puts arrWord
		# Retornamos la palabra
		return arrWord
	end

end

class Uniforme < Mutador

	def isFixnum(num)
		# Se parsea el digito y se convierte en un arreglo
		num2 = num.to_s.split("").map(&:to_i)
		# Se inicializa la variable sum (contener el calculo de los digitos)
		sum = 0
		# Se calcula el tamaño del arreglo
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

	def isString(word)
		# Se convierte la palabra en un arreglo
		word = word.split("")
		i = 0
		# Se itera en el arreglo que contiene todas
		# las letras de la palabra, si el index del arreglo
		# es par se cambia la letra a mayuscula y si el
		# index es impar se convierte en minuscula
		word.each do |x|
			if i % 2 == 0 
				x.upcase!
			else
				x.downcase!
			end
			i += 1
		end
		# Se convierte el arreglo en un string
		word = word.join
		puts word
		# Retornamos la palabra
		return word
	end

	def isArray(arr)
		arrResult = []
		arr.each do |x|
			arrResult.push( x.receive(Uniforme.new()) )
		end
		return arrResult
	end

end

class Oscuro < Mutador

	def isFixnum(num)	
		# Se parsea el digito y se convierte en un arreglo
		num2 = num.to_s.split("").map(&:to_i)
		# Se inicializa la variable i y arr (contener el calculo de los digitos)
		arr = []
		i = 0
		# Se calcula el tamaño del arreglo
		length = num2.length
		# Se verifica que el numero tenga mas de un digito
		if length > 1
			# Se itera en el arreglo se suman cada
			# uno de sus digitos
			num2.each do |x|
				if i % 2 == 0
					arr.push(x)
				end 
				i += 1
			end
			arr = arr.join.to_i
			puts arr
			return arr
		else 
			puts num
			return num
		end
	end

	def isString(word)
		# Se inicializa el ArregloDerecho
		arrRight = []
		# Se inicializa el Arreglo Izquierdo
		arrLeft = []
		i = 0
		# Se convierte la palabra en un arreglo
		word = word.split("")
		# Se itera en el arreglo
		word.each do |x|
			# Si el index del arreglo es par se guarda
			# en el arreglo derecho
			if i % 2 == 0 
				arrRight.push(x)
			# Si el index del arreglo es impar se guarda
			# en el arreglo derecho
			else
				arrLeft.push(x)
			end
			i += 1
		end
		# Se convierte el arreglo derecho e izquiero en string
		arrRight = arrRight.join
		arrLeft = arrLeft.join
		# Se concatenan los string
		wordAll = arrLeft << arrRight
		puts wordAll
		# Se retorna la palabra
		return wordAll
	end

	def isArray(arr)
		# Calculamos el largo del arreglo
		length = arr.length
		# Calculamos cuanto seria el 50% de los elementos
		# incluyendo el redondeo
		porcent = redondeo(length*0.5)
		# Se eligen el 50% de los valores
		arr = arr.sample(porcent)
		arrResult = []

		arr.each do |x|
			arrResult.push( x.receive(Oscuro.new()) )
		end
		return arrResult
	end

end

class Fixnum

	def receive(nodo)
		nodo.isFixnum(self)
	end
end

class String

	def receive(nodo)
		nodo.isString(self)
	end
end

class Array

	def receive(nodo)
		nodo.isArray(self)
	end
end

def redondeo(x)
	valorEntero = Integer(x)
	if (x - valorEntero >= 0.5)
    	return valorEntero + 1
	else
   		return valorEntero
	end
end
