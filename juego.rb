require "./palabra.rb"
require "./display.rb"

class Wordle
  include Display
  attr_accessor :palabra

  def initialize
    @palabra = Palabra.new
    @cont_turnos = 0
  end

  def iniciar_partida
    instrucciones_inicio
    obtener_palabra
  end

  def obtener_palabra
    loop do
      prompt
      #puts @palabra.solucion
      palabra_usuario = gets.chomp
      until @palabra.es_valida?(palabra_usuario)do
        puts "Por favor introduce una palaba válida de cinco caracteres"
        palabra_usuario = gets.chomp
      end
      @palabra.comprobar_palabra(palabra_usuario)
      @cont_turnos += 1
      break if @cont_turnos == 5
    end
    fin_partida(@palabra.solucion)
  end
end

Wordle.new.iniciar_partida
