class Player
    attr_accessor :name, :life_points
    @@all_users = []

    def initialize(name)
        @name = name
        @life_points = 10
        @@all_users << self
    end

    def show_state
        puts "#{name} a #{life_points} points de vie."
    end

    def gets_damage(damage)
        @life_points -= damage
        if @life_points <= 0 
            return "Le joueur #{name} a été tué !"
        else @life_points > 0
            return " #{name} a #{life_points} points de vie"
        end
    end

    def attacks(name_attacked)
        puts "Le joueur #{name} attaque le joueur #{name_attacked.name}"
        points_of_damage = compute_damage
        puts "Il lui inflige #{points_of_damage} points de vie"
        name_attacked.gets_damage(points_of_damage)
    end

    def compute_damage
        return rand(1..6)
    end

    def self.all
        return @all_users
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
        @@all_users << self
    end

    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
    end

    def gets_damage(damage)
        @life_points -= damage
        if @life_points <= 0 
            return "Le joueur #{name} a été tué !"
        else @life_points > 0
            return " #{name} a #{life_points} points de vie"
        end
    end

    def attacks(name_attacked)
        puts "Le joueur #{name} attaque le joueur #{name_attacked.name}"
        points_of_damage = compute_damage
        puts "Il lui inflige #{points_of_damage} points de vie"
        name_attacked.gets_damage(points_of_damage)
    end

    def compute_damage
        return rand(1..6) * weapon_compute
    end

    def weapon_selection
        weapon_upgrade = weapon_compute
        if weapon_upgrade > @weapon_level
            puts "Le joueur #{name} sélectionne sa nouvelle arme de niveau #{weapon_upgrade}"
            @weapon_level = weapon_upgrade
        else weapon_upgrade <= @weapon_level
            puts "Le joueur #{name} conserve son arme de niveau #{@weapon_level}."
        end

    end

    def weapon_compute
        return rand(1..6) 
    end

    #def healthpack_search
    #    if healthpack_compute = 1
    #        puts "Tu n'as rien trouvé... "
    #    elsif healthpack_compute > 1 && healthpack_compute => 5
    #        puts "Bravo, tu as trouvé un pack de +50 points de vie !"  
    #    else healthpack_compute < 5 
    #        puts "Waow, tu as trouvé un pack de +80 points de vie !"
    #end

    #def healthpack_compute
    #    return rand(1..6) 
    #end

    def self.all
        return @all_users
    end
end