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
      return rand(1..6) * weapon_level
  end

  def search_weapon
     @search_weapon = search_weapon_compute * 
     if @search_weapon > @weapon_level
          weapon_level = search_weapon 
          puts "Tu prends ta nouvelle arme de niveau #{weapon_level}"
      else 
          puts "Tu conserves ton arme de niveau  #{weapon_level}"
     end
  end

  def search_weapon_compute
      return rand(1..6)
      puts "Tu as trouvé une arme de niveau #{search_weapon_compute}."
  end

  def self.all
      return @all_users
  end
end


