#This class holds rover's current orientation. State pattern is used to manage orientation. Depending on the current orientation state, events will produce different output.
class Orientation 
  def turn_left; end
  def turn_right; end
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

 
