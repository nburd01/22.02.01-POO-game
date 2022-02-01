
class Player
    attr_accessor :name, :life_points
    @damage = 0
  
    def initialize(name)
      @name = name
      @life_points = 10
    end
  
    def show_state
      puts "#{name} a #{life_points} de vie"
    end
  
    def gets_damage(damage)
      @life_points = @life_points - damage
       if @life_points <= 0
        return "Le joueur #{name} a été tué"
       else @life_points > 0
        return "#{name} a #{life_points} de vie"
       end
    end
  
    def attacks(name_attacked)
  
      puts "Le joueur #{name} attaque le joueur #{name_attacked.name}"
      points_of_damage = compute_damage
      puts "Il lui inflige #{points_of_damage} point(s) de dommage"
      name_attacked.gets_damage(points_of_damage)
  
    end
  
    def compute_damage
      return rand(1..6)
    end
  
  end