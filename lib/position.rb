class Position
  attr_accessor :x, :y, :orientation, :plateau 
   
  def initialize(params, plateau)
    @x, @y = params.split[0].to_i, params.split[1].to_i
    @orientation = set_orientation(params.split[2])
    @plateau = plateau
  end
  
  def turn_left
    @orientation = @orientation.turn_left
  end
  
  def turn_right
    @orientation = @orientation.turn_right
  end
  
  def move_forward
    coordinates = @orientation.move_forward
    begin
      move_possible?(coordinates)
      @x += coordinates[0] 
      @y += coordinates[1] 
    end
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
  
  #TODO check if this should be moved to some where else.
  def move_possible?(ordinates)
    if @x + ordinates[0] > @plateau.x || @x + ordinates[0] < 0 || @y + ordinates[1] > @plateau.y || @y + ordinates[1] < 0
      raise Exception, 'On the edge of plateau. Not possible to move forward.'
    end
  end
  
  def current_orientation
    @orientation.class.to_s[0,1]
  end
end
