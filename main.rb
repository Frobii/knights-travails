require './knights_travails.rb'

a = Knight.new

a.gridify

a.display_board

puts "\n"

a.possible_nodes

a.print_paths

puts "\n"

p a.knight_moves([1,2], [3,6])
