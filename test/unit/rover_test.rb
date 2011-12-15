require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

describe Rover do
  before do
    @plateau = Plateau.new('5 5')
  end
        
  it "should be able to set the initial co-ordinates, orientation and plateau it should navigate" do
    rover = Rover.new('1 2 N', @plateau)
    rover.x.must_equal 1
    rover.y.must_equal 2
    rover.orientation.must_be_instance_of NorthFaced 
    rover.plateau.must_equal @plateau
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
  
  describe 'on the edge of the plateau' do
    #TODO find if there are some way to match exceptions. Also try moving this code repetation
    it "should not move when on left edge of the plateau and faced east" do
      @rover = Rover.new('5 2 E', @plateau)
      begin
        @rover.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @rover.current_position.must_equal '5 2 E'
    end
    
    it "should not move when on left edge of the plateau and faced west" do
      @rover = Rover.new('0 2 W', @plateau)
      begin
        @rover.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @rover.current_position.must_equal '0 2 W'
    end
    
    it "should not move when on bottom edge of the plateau and faced south" do
      @rover = Rover.new('2 0 S', @plateau)
      begin
        @rover.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @rover.current_position.must_equal '2 0 S'
    end
    
     it "should not move when on top edge of the plateau and faced north" do
      @rover = Rover.new('2 5 N', @plateau)
      begin
        @rover.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @rover.current_position.must_equal '2 5 N'
    end
  end
end


