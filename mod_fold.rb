# Definición del modulo fold

module Dfs
  
  def dfs
    if block_given?
      yield self
      self.each do |child|
        child.dfs do |node|
          yield node
        end
      end
    else
      puts 'No se dio ningun bloque asi que imprimiremos el recorrido'
    end
  end
  
  def fold
    
  end
end
