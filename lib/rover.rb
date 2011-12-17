class Rover
  attr_accessor :position
  
  def initialize(params, plateau)
    @position = Position.new(params, plateau)
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
    @position.turn_left
  end
  
  def turn_right
    @position.turn_right
  end
  
  def move_forward
    @position.move_forward
  end
 
  def current_position
    @position.current_position
  end
 
  def x
    @position.x
  end
  
  def y
    @position.y
  end

  def orientation
    @position.orientation
  end
end


