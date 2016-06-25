# Definición del módulo bfs
module Bfs
  # Hace un recorrido bfs a un arbol, ejecutando en cada nodo el codigo
  # en el bloque IMPLICITO
  def Bfs.bfs # {bloque Implicito}
    queue = []
    queue.push(self)
    # Mientras nuestra cola no este vacia, aplicaremos el procedimiento
    while(queue.size != 0)
      actualNode = queue.shift
      # Verificamos si se recibio un bloque
      if block_given?
        # Ejecutamos el bloque con el nodo actual
        yield self
      else
        # Imprimimos el valor
        puts actualNode.value
      end
      # Iteramos sobre los hijos del nodo
      actualNode.each do |child|
        queue.push(child)
      end
    end

    
    
  end
  
  # Hace un recorrido bfs a un arbol, y guarda cada nodo que cumpla con la condicion
  # del bloque del predicado
  def Bfs.recoger (&block)
    
  end
  
  
  
end