require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

describe Rover do
 
  it "should set the initial co-ordinates and orientation" do
    rover = Rover.new('1 2 N')
    rover.x.must_equal 1
    rover.y.must_equal 2
    rover.orientation.must_be_instance_of NorthFaced 
  end
  
  it "should be able to return its current position" do
    rover1 = Rover.new('1 2 W')
    rover2 = Rover.new('5 4 N')
    rover1.current_position.must_equal '1 2 W' 
    rover2.current_position.must_equal '5 4 N' 
  end  
  
  describe 'orientation' do
    it "should be able to set the initial orientation to north" do
      rover = Rover.new('1 2 N')
      rover.orientation.must_be_instance_of NorthFaced
    end 
    
    it "should be able to set the initial orientation to south" do
      rover = Rover.new('1 2 S')
      rover.orientation.must_be_instance_of SouthFaced
    end 
    
    it "should be able to set the initial orientation to east" do
      rover = Rover.new('1 2 E')
      rover.orientation.must_be_instance_of EastFaced
    end 
    
    it "should be able to set the initial orientation to west" do
      rover = Rover.new('1 2 W')
      rover.orientation.must_be_instance_of WestFaced 
    end 
  end 
  
  describe 'instructions' do
    describe 'for rotation' do
      describe 'when north faced' do
        before do
          @rover = Rover.new('1 2 N')
        end
        
        it "should be able to turn left" do
          @rover.turn_left
          @rover.orientation.must_be_instance_of WestFaced
        end 
      
        it "should be able to turn right" do
          @rover.turn_right
          @rover.orientation.must_be_instance_of EastFaced
        end 
        
        it "should be able to move forward" do
          @rover.move_forward
          @rover.x.must_equal 1
          @rover.y.must_equal 3
        end 
      end  
      
      describe 'when south faced' do
        before do
          @rover = Rover.new('1 2 S')
        end
        
        it "should be able to turn left" do
          @rover.turn_left
          @rover.orientation.must_be_instance_of EastFaced
        end 
      
        it "should be able to turn right" do
          @rover.turn_right
          @rover.orientation.must_be_instance_of WestFaced
        end 
        
        it "should be able to move forward" do
          @rover.move_forward
          @rover.x.must_equal 1
          @rover.y.must_equal 1
        end 
      end  
      
      describe 'when east faced' do
        before do
          @rover = Rover.new('1 2 E')
        end
        
        it "should be able to turn left" do
          @rover.turn_left
          @rover.orientation.must_be_instance_of NorthFaced
        end 
      
        it "should be able to turn right" do
          @rover.turn_right
          @rover.orientation.must_be_instance_of SouthFaced
        end 
        
        it "should be able to move forward" do
          @rover.move_forward
          @rover.x.must_equal 2
          @rover.y.must_equal 2
        end 
      end  
      
      describe 'when west faced' do
        before do
          @rover = Rover.new('1 2 W')
        end
        
        it "should be able to turn left" do
          @rover.turn_left
          @rover.orientation.must_be_instance_of SouthFaced
        end 
      
        it "should be able to turn right" do
          @rover.turn_right
          @rover.orientation.must_be_instance_of NorthFaced
        end 
        
        it "should be able to move forward" do
          @rover.move_forward
          @rover.x.must_equal 0
          @rover.y.must_equal 2
        end 
      end  
    end
  end 
 
end


