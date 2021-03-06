require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Julie")
player2 = Player.new("José")

puts "voici #{player1.name} et #{player2.name}."

while player1.life_points > 0 && player2.life_points > 0  
    puts ""
    puts "Voici l'état de chaque joueur:"
    print player1.show_state
    print player2.show_state
    
    puts "Passons à la phase d'attaque"
    player2.attacks(player1)
    if player1.life_points <= 0
        puts "#{player1.name} a été tué !"
        break
        next
    elsif player2.life_points <= 0
        puts "#{player2.name} a été tué !"
        break
        next
    end
    player1.attacks(player2)
end
puts "Game over"


binding.pry