class Rover
  attr_accessor :x, :y, :orientation, :plateau
  
  def initialize(position, plateau)
    @x = position.split[0].to_i
    @y = position.split[1].to_i
    @orientation = set_orientation(position.split[2]) 
    @plateau = plateau
  end
  
  def process_instructions(instruction)
    instruction.each_char do |command|
      case command
      when 'M' then move_forward
      when 'L' then turn_left
      when 'R' then turn_right
      end
    end
  end
  
  def turn_left
    @orientation = @orientation.turn_left
  end
  
  def turn_right
    @orientation = @orientation.turn_right
  end
  
  def move_forward
    ordinates = @orientation.move_forward
    if @x + ordinates[0] > @plateau.x || @x + ordinates[0] < 0 || @y + ordinates[1] > @plateau.y || @y + ordinates[1] < 0
      raise Exception, 'On the edge of plateau. Not possible to move forward.' and return
    end
      
    @x += ordinates[0] 
    @y += ordinates[1] 
  end
 
  def current_position
    "#{@x} #{@y} #{current_orientation}"
  end
  
  private
  
  def set_orientation(cardinal_point)
    #TODO check if this should be moved to some kind of factory
    return NorthFaced.new if cardinal_point == 'N'
    return SouthFaced.new if cardinal_point == 'S'
    return EastFaced.new if cardinal_point == 'E'
    return WestFaced.new if cardinal_point == 'W'
    raise Exception, 'Invalid orientation' #unless ['N', 'S', 'E', 'W'].include?(cardinal_point) #TODO handle this
  end  
  
  def current_orientation
    @orientation.class.to_s[0,1]
  end
end


