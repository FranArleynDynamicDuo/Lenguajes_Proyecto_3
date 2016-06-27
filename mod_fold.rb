# Definición del modulo fold

module Dfs
  
  def dfs
    if block_given?
      self.each do |child|
        child.dfs block
        yield child
      end
      yield self
    else
      puts 'No se dio ningun bloque asi que imprimiremos el recorrido'
    end
  end
  
  def fold
    
  end
end
