require './knights_travails.rb'

a = Knight.new

a.gridify

a.display_board

puts "\n"

a.possible_nodes

puts "\n"

puts "The knight made these moves to get to it's destination: "
p a.knight_moves([0,0], [7,7])
