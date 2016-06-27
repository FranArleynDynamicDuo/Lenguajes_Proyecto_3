# Definición del módulo bfs
module Bfs
  # Hace un recorrido bfs a un arbol, ejecutando en cada nodo el codigo
  # en el bloque IMPLICITO
  def bfs # {bloque Implicito}
    # Verificamos si se recibio un bloque
    if block_given?
      queue = []
      queue.push(self)
      # Mientras nuestra cola no este vacia, aplicaremos el procedimiento
      while(queue.size != 0)
        actualNode = queue.shift
        # Ejecutamos el bloque con el nodo actual
        yield actualNode
        # Imprimimos el valor
        puts actualNode.value
        # Iteramos sobre los hijos del nodo
        actualNode.each do |child|
          # Agregamos al hijo si no es nil
          unless child.nil?
            queue.push(child)
          end
        end
      end
      
    else
      puts 'No se dio ningun bloque asi que imprimiremos el recorrido'
    end
  end
  
  # Hace un recorrido bfs a un arbol, y guarda cada nodo que cumpla con la condicion
  # del bloque del predicado
  def recoger (&block)
    listaNodos = []
    self.bfs do |child|
      # Si el predicado del bloque es true agregamos el elemento a la lista
      if block.call(child)
        listaNodos.push(child)
        puts 'se evaluo true!'
      else
        puts 'se evaluo false!'
      end
    end
    puts ''
    puts 'Imprimiendo lista'
    listaNodos.each do |elemento|
      print elemento.value
      print " "
    end
  end
  
  
  
end