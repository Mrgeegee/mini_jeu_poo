#require 'pry'

class Player
    attr_accessor :name , :life_points
    
    
    def initialize(name)
        @name = name
        @life_points = 10
    end
    
    def show_state
        puts "#{name} a #{life_points} points de vie"
    end
    
    def gets_damage(damage_points)
        damage_received = damage_points.to_i
        @life_points = @life_points - damage_received
        
        if life_points <= 0
            puts " Le joueur #{name} a été tué ! "
        end
    end
    
    def attacks(player_2)
        defence = player_2.name
        
        puts " Le joueur #{name} attaque le joueur #{defence}"
        
        random_damage = compute_damage.to_i
        
        puts " Le joueur #{name} inflige #{random_damage} à #{defence}"
        
        player_2.gets_damage(random_damage)
        
        
        
    end
    
    def compute_damage
        return rand(1..6)
    end
end
class HumanPlayer
    attr_accessor :name , :life_points , :weapon_level
    
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end
    
    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end
    
    def gets_damage(damage_points)
        damage_received = damage_points.to_i
        @life_points = @life_points - damage_received
        
        if life_points <= 0
            puts " Le joueur #{name} a été tué ! "
        end
    end
    def attacks(player_2)
        defence = player_2.name
        
        puts " Le joueur #{name} attaque le joueur #{defence}"
        
        random_damage = compute_damage.to_i
        
        puts " Le joueur #{name} inflige #{random_damage} à #{defence}"
        
        player_2.gets_damage(random_damage)
        
        
        
    end
    
    def compute_damage
        rand(1..6) * @weapon_level
    end
    
    
    def search_weapon
        find_weapon = rand(1..6)
        
        puts "#{name} tu as trouvé une arme de niveau #{find_weapon}"
        puts ""
        puts ""
            if weapon_level < find_weapon
                
                puts " Wahoo elle est meilleur que ton arme actuelle : on la prends :D !!"
                puts ""
                puts ""
                @weapon_level = find_weapon
            
            else weapon_level >= find_weapon
            
                puts " ARG Elle n'est pas mieux que ton arme actuelle POUBELLE.."
                puts ""
                puts ""
            end
            
        end
    
    def search_heal_pack
        find_heal_pack = rand(1..6)
        
        size_heal_pack = find_heal_pack.to_i
        puts size_heal_pack
        if size_heal_pack == 1
            puts " Tu n'as trouvé aucun pack de soin :( "
            puts ""
            puts ""
            
        elsif size_heal_pack == 2 || size_heal_pack == 3 || size_heal_pack == 4 || size_heal_pack == 5
            puts " Tu as trouvé un pack de +50 point de vie ! Cool non ?"
            puts ""
            puts ""
            add_heal_pack = life_points + 50
            if add_heal_pack < 100
                @life_points = add_heal_pack
            else add_heal_pack >= 100
                @life_points = 100
                end
            
        else size_heal_pack == 6
            puts " Tu viens de trouver le graal , +80 Point de vie ! Youpiiiiii !"
            puts ""
            puts ""
            add_heal_pack = life_points + 80
            if add_heal_pack < 100
                @life_points = add_heal_pack
                else add_heal_pack >= 100
                @life_points = 100
            end
        end
        
        
    end
    
    
end
#binding.pry
