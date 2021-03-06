# Definición del modulo fold

module Dfs
  # Hace un recorrido DFS a un arbol, ejecutando en cada nodo el codigo
  # en el bloque IMPLICITO
  def dfs # {bloque Implicito}
    # Verificamos si se recibio un bloque
    if block_given?
      # Ejecutamos el bloque con el nodo actual
      yield self
      # Recorremos los hijos del nodo actual
      self.each do |child|
        # Aplicamos dfs sobre los hijos
        child.dfs do |node|
          # Aplicamos el bloque
          yield node
        end
      end
    # Si no se recibio un bloque, se termina el procedimiento
    else
      puts 'No se dio ningun bloque asi que imprimiremos el recorrido'
    end
  end
  
  # Hace un recorrido dfs a un arbol, aplicando una operacion en cada nodo y
  # acumulando el resultado
  def fold(acum) # {bloque Implicito}
    # Verificamos si se recibio un bloque
    if block_given?
      self.dfs do |node|
        # Aplicamos el bloque y guardamos el resultado
        acum = yield(node, acum)
      end
      # Retornamos el resultado final
      return acum
    # Si no se recibio un bloque, se termina el procedimiento
    else
      puts 'No se dio ningun bloque asi que imprimiremos el recorrido'
    end    
  end
  
end
