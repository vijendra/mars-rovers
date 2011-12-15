# Rovers are to be landed on a plateau. The plateau is rectangular. Lower-left coordinates are assumed to be 0,0.
# Upper co-ordinate point is provided as input. 
class Plateau
  attr_accessor :x, :y, :rovers
  
  def initialize(coords)
    bounds = coords.split(' ')
    @x = bounds[0].to_i
    @y = bounds[1].to_i
    @rovers = []
  end
  
  def land_a_rover(rover)
    raise Exception, 'Out of Plateau area' if rover.x > x || rover.y > y
    @rovers << rover
  end
  
end
 

