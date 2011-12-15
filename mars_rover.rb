require File.expand_path("../init.rb", __FILE__)

puts "Setting the plateau cordinate to 5,5"
@plateau = Plateau.new('5 5')

puts "Adding a rover Rover_a with position 1 2 N to the plateau"
@rover = Rover.new('1 2 N', @plateau)
@plateau.land_a_rover(@rover)

puts "Giving instruction 'LMLMLMLMM' to the rover"
@rover.process_instructions('LMLMLMLMM')

puts "Rover_a's current position is #{@rover.current_position}"
puts "========================================================="
 
puts "Adding another rover rover_b with position 1 2 N to the same plateau"
@rover = Rover.new('3 3 E', @plateau)
@plateau.land_a_rover(@rover)

puts "Giving instruction 'MMRMMRMRRM' to the rover"
@rover.process_instructions('MMRMMRMRRM')

puts "Rover_b's current position is #{@rover.current_position}"

