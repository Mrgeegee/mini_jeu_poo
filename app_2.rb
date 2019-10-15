require 'bundler'

Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts " ------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------

______ _____ _____ _    _ _______
|  ____|_   _/ ____| |  | |__   __|
| |__    | || |  __| |__| |  | |
|  __|   | || | |_ |  __  |  | |
| |     _| || |__| | |  | |  | |
|_|    |_____\_____|_|  |_|  |_|  "
puts ""
puts ""
puts ""

puts " Nous avons besoin de ton prénom ( Il servira te faire combattre à morts :) )"
print ">"
name_utilisateur = gets.chomp

user = HumanPlayer.new("#{name_utilisateur}")

puts user.name

#enemies_array = Array.new

player1 = Player.new("Kaaris")
player2 = Player.new("Booba")
#enemies_array << player1
#enemies_array << player2

#puts enemies_array
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    
    
    
    puts "
    ------------------------------------
    | Quelle action veux-tu effectuer ?
    |
    |  a - chercher une meilleure arme
    |  s - chercher à se soigner
    |
    | Attaquer un joueur en vue :
    |  0 - Kaaris a #{player1.life_points} points de vie
    |  1 - Booba a #{player2.life_points} points de vie
    -------------------------------------"
    puts ""
    puts " Je te rapelle que :"
    puts ""
    puts user.show_state
    print "Que veux-tu faire ?"
    action_user = gets.chomp
    
    
    puts " "
    puts " "
    
    if action_user == "a"
        user.search_weapon
    elsif action_user == "s"
        user.search_heal_pack
    elsif action_user == "0"
        user.attacks(player1)
    elsif action_user == "1"
        user.attacks(player2)
    else
        puts " = > Sa n'existe pas , tant pis pour toi !"
    end
    
    puts " = > Les ennemies attaquent a leur tour :"
    puts ""
    puts ""
    
    if player1.life_points <= 0
        puts " #{player1.name} Et morts il ne peux donc plus attaquer .. "
    else
    puts " Kaaris attaque :"
    player1.attacks(user)
    end
    
    puts ""
    puts " #{user.name} il te reste #{user.life_points} de vie !"
    puts ""
    
    if player2.life_points <= 0
        
        puts " #{player2.name} Et morts il ne peux donc plus attaquer .. "
        
    else
    puts " Booba Attaque :"
    player2.attacks(user)
    end
    
end
