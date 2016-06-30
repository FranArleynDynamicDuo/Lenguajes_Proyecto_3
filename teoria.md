# Estudiantes
### 10-10290 - Arleyn Goncalves
### 10-10717 - Francisco Sucre
---
# Respuestas

> Los lenguajes de programación orientados a objetos que poseen herencia simple están limitados a incorporar comportamientos de un solo ancestro al momento de definir una clase.
<[Si|No] [pero]...>
Depende, se considera que tiene un ancestro si no nos importa todos los ancestros de la clase padre, mientras que si consideramos todos los ancestros de la clase padre entonces se puede decir que se tiene mas de un ancestro. 

> Lenguajes de POO con un sistemas de tipos estático (C++, Java, C\#) no tienen la posibilidades de elegir la implementación de un método a tiempo de ejecución (despacho dinámico).
<[Si|No] [pero]...>
No, porque ya que los tres lenguajes tienen śistemas de tipos estáticos, Java trabaja con despacho dinámico. 

> La introspección y reflexibidad son conceptos que se manejan en la POO pero no guardar ninguna relación entre sí.
<[Si|No] [pero]...>
No, si guardan relacion ya que los dos pueden ocurrir en tiempo de ejecucion y ademas que para que la instrospeccion sea posible, es necesaria la reflexibidad, ya que el programa debe conservar y poder accesar a la informacion estructural del programa de alto nivel luego de ser compilado.

> En un lenguaje con un sistema de tipos dinámico la sobrecarga de métodos es innata y representa una comodidad dado que permite implementar un mismo método para distintos tipos.
<[Si|No] [pero]...>
No, la sobrecarga es una caracteristica de los lenguajes con tipos estaticos y se resuelve al momento de compilacion, podemos ver ejemplos de esto en Java que permite la sobrecarga y ruby que no lo permite, pero lo que si se permite es el uso de funciones virtuales que permite a una funcion "hijo" llamar a su propia version de la funcion diferente a la heredada lo cual tiene un poder muy parecido al de la sobrecarga.

> En los lenguajes POO existen los términos interfaz, módulo, clase abstracta, rol, etc; definidos como objetos que pueden encapsular definiciones de clases o implementaciones concretas de métodos.
<[Si|No] [pero]...>
Si, precisamente porque en los lenguajes POO existe la herencia por medio de la cual objetos puede llamar a metodos o tener caracteristicas de otros objetos, y las interfaces, modulos, etc son objetos

> Los métodos virtuales permiten asociar, al momento de compilar, una implementación de un método sobrecargado con una llamada del mismo; eliminando el **overhead** del despacho dinámico.
<[Si|No] [pero]...>
si, porque el se busca directamente en la Virtual Tables, 

> Cuando un lenguaje de POO tiene herencia simple no ocurre el problema del diamante pero de igual forma pueden existir llamadas ambiguas de métodos, dado que incorporar interfaces, módulos, protocolos, etc, no evita colisión de nombres.
<[Si|No] [pero]...>
No, un lenguaje de POO con herencia simple maneja estas ambiguedades con una cadena de herencia, en la cual se buscara el metodo en la subclase mas profunda y sino se encuentra en esa se buscara en la clase de la que hereda.

> El paso de mensaje es un término que se maneja en modelos concurrentes, también de POO y es equivalente a la llamada de una función.
<[Si|No] [pero]...>
Si, el paso de mensaje se suele implementar como llamadas a los metodos de otros objetos.

> Sin importar la herencia del lenguaje de POO, una clase podría tener más de un ancestro.
<[Si|No] [pero]...>
Depende, si importa la herencia debido a que en herencia multiple se tiene mas de un ancestro, pero en el caso de herencia simple hay que considerar si se toma en cuenta los ancestros de la clase padre. 
