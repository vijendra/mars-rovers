require File.expand_path("../init.rb", __FILE__)

puts"Enter the upper-right coordinates of the plateau. Example 5 5"
@plateau = Plateau.new(gets.chomp)

puts "Enter the initial position and co-ordinates of rover Rover_a. Example 1 2 N "
@rover = Rover.new(gets.chomp, @plateau)
@plateau.land_a_rover(@rover)

puts "Enter the initial instruction for Rover_a. Example LMLMLMLMM"
@rover.process_instructions(gets.chomp)

puts "Rover_a's current position is #{@rover.current_position}"
puts "========================================================="
 
puts "Adding another rover to the plateu."
puts "Enter the initial position and co-ordinates of rover Rover_b. Example 3 3 E" 
@rover = Rover.new(gets.chomp, @plateau)
@plateau.land_a_rover(@rover)

puts "Enter the initial instruction for Rover_b. Example MMRMMRMRRM"
@rover.process_instructions(gets.chomp)

puts "Rover_b's current position is #{@rover.current_position}"

