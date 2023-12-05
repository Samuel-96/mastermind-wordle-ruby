require "./display.rb"

class Palabra
  include Display
  attr_accessor :solucion

  def initialize
    seleccionar_idioma
    idioma = gets.chomp
    until idioma == "en" || idioma == "es" do
      seleccionar_idioma
      idioma = gets.chomp
    end
    idioma == "es" ? pal = File.open("./palabras.txt").read.split : pal = File.open("./words.txt").read.split
    num_azar = Random.new
    @solucion = pal[num_azar.rand(0..pal.length)]
  end

  def comprobar_palabra(palabra_usuario)
    comprobacion = []
    fin_partida(@solucion) if palabra_usuario == @solucion
    palabra_usuario.chars.each_with_index do |chr, index|
      if @solucion.include?(chr)
        if @solucion[index] == chr
          comprobacion << [chr, "acierto"]
        else
          comprobacion << [chr, "existe"]
        end
      else
        comprobacion << [chr, "fallo"]
      end
    end
    colorizar_intento(comprobacion)
  end


  def es_valida?(palabra_usuario)
    if palabra_usuario.length == 5
      true
    else
      false
    end
  end
end