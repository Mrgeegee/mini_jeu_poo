require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Kaaris")
player2 = Player.new("Booba")


    puts ""
    puts " A ma droite #{player1.name}"
    puts ""
    puts " A ma Gauche #{player2.name}"
    puts ""


while player1.life_points > 0 && player2.life_points > 0
        
        
    puts " Voici l'état de chaque joueur :"
    puts ""
    puts player1.show_state
    puts player2.show_state
    puts ""
    puts "Passons à la phases d'attaque:"



    player1.attacks(player2)
    puts ""
    
        if player2.life_points == 0
            break
        end
        
        puts ""
    player2.attacks(player1)
end

#binding.pry


