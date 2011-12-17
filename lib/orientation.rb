#This class holds rover's current orientation. State pattern is used to manage orientation. Depending on the current orientation state, events will produce different output.
class Orientation 
  def turn_left; end
  def turn_right; end
=begin  
  def move_possible?((x, y, plateau, x_move, y_move)
    if x + x_move > plateau.x || x + x_move < 0 || y + y_move > plateau.y || y + y_move < 0
      raise Exception, 'On the edge of plateau. Not possible to move forward.'
    end
  end
=end  
end

class NorthFaced < Orientation
  def turn_left
    WestFaced.new
  end
  
  def turn_right
    EastFaced.new
  end
  
  def move_forward
    [0, 1]
  end
  
=begin  
  def move_forward(position, plateau)
    if move_possible?(position.x, position.y, plateau, 0, 1) 
      position.y += 1
    end
  end
=end  
end

class SouthFaced < Orientation
 def turn_left
    EastFaced.new
  end
  
  def turn_right
    WestFaced.new
  end
  
  def move_forward
    [0, -1]
  end
end

class EastFaced < Orientation
  def turn_left
    NorthFaced.new
  end
  
  def turn_right
    SouthFaced.new
  end
  
  def move_forward
    [1, 0]
  end
end

class WestFaced < Orientation
  def turn_left
    SouthFaced.new
  end
  
  def turn_right
    NorthFaced.new
  end
  
  def move_forward
    [-1, 0]
  end
end

 
