require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

describe Rover do
  before do
    @plateau = Plateau.new('5 5')
  end
        
  it "should be able to set the initial position" do
    rover = Rover.new('1 2 N', @plateau)
    rover.position.x.must_equal 1
    rover.position.y.must_equal 2
    rover.position.orientation.must_be_instance_of NorthFaced 
    rover.position.plateau.must_equal @plateau
  end
  
  it "should be able to return its current position" do
    rover1 = Rover.new('1 2 W', @plateau)
    rover2 = Rover.new('5 4 N', @plateau)
    rover1.current_position.must_equal '1 2 W' 
    rover2.current_position.must_equal '5 4 N' 
  end  
  
  describe 'orientation' do
    it "should be able to set the initial orientation to north" do
      rover = Rover.new('1 2 N', @plateau)
      rover.orientation.must_be_instance_of NorthFaced
    end 
    
    it "should be able to set the initial orientation to south" do
      rover = Rover.new('1 2 S', @plateau)
      rover.orientation.must_be_instance_of SouthFaced
    end 
    
    it "should be able to set the initial orientation to east" do
      rover = Rover.new('1 2 E', @plateau)
      rover.orientation.must_be_instance_of EastFaced
    end 
    
    it "should be able to set the initial orientation to west" do
      rover = Rover.new('1 2 W', @plateau)
      rover.orientation.must_be_instance_of WestFaced 
    end 
  end 
  
  describe 'instructions' do
    describe 'for rotation' do
      describe 'when north faced' do
        before do
          @rover = Rover.new('1 2 N', @plateau)
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
          @rover = Rover.new('1 2 S', @plateau)
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
          @rover = Rover.new('1 2 E', @plateau)
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
          @rover = Rover.new('1 2 W', @plateau)
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


