require 'rainbow'

module Display
  def instrucciones_inicio
    puts Rainbow("BIENVENIDO A WORDLE_RUBY_EDITION").green.concat("\nTienes que adivinar la palabra oculta en 6 intentos y el color de las letras cambia\npara mostrar lo cerca que estás. Para comenzar el juego, simplemente ingrese cualquier palabra, por ejemplo: MEDIO\n")
    sleep(2)
    puts " \n#{Rainbow(" M ").bg(:green).black}#{Rainbow(" E ").bg(:gray).black}#{Rainbow(" D ").bg(:yellow).black}#{Rainbow(" I ").bg(:gray).black}#{Rainbow(" O ").bg(:green).black} \n"
    puts "\nE , I no está en la palabra objetivo en absoluto.
D está en la palabra pero en el lugar equivocado.
M , O está en la palabra y en el lugar correcto.\n"
    sleep(2)
    puts "Resultado: #{Rainbow(" M U N D O ").bg(:green).black}"
    sleep(1)
  end

  def prompt
    puts "\nIntroduce la palabra: "
  end

  def fin_partida(solucion)
    print "\nLa palabra era: #{Rainbow(solucion).bg(:green).black}\n"
    puts "Cerrando programa"
    sleep(2)
    exit
  end

  def seleccionar_idioma()
    pp "Select which language to play [type 'en' for english] "
    pp "En qué idioma quieres jugar [escribe 'es' para español] "
  end

  def colorizar_intento(array)
    new_array = []

    array.each do |pos|
      if pos.include?("acierto")
        new_array.push(Rainbow(pos[0].concat(" ")).bg(:green).black)
      elsif pos.include?("fallo")
        new_array.push(Rainbow(pos[0].concat(" ")).bg(:gray).black)
      elsif pos.include?("existe")
        new_array.push(Rainbow(pos[0].concat(" ")).bg(:yellow).black)
      end
    end
    puts new_array.join('')
  end
end