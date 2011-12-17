require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

describe Position do
  before do
    @plateau = Plateau.new('5 5')
  end
  
  it "should be able set the initial co-ordinates, orientation" do
    position = Position.new('3 4 N', @plateau)
    position.x.must_equal 3
    position.y.must_equal 4
    position.orientation.must_be_instance_of NorthFaced 
    position.plateau = @plateau
  end
  
  it "current position" do
    position = Position.new('3 4 N', @plateau)
    position.current_position.must_equal '3 4 N' 
  end  
  
  describe 'orientation' do
    it "should be able to set the initial orientation to north" do
      position = Position.new('1 2 N', @plateau)
      position.orientation.must_be_instance_of NorthFaced
    end 
    
    it "should be able to set the initial orientation to south" do
      position = Position.new('1 2 S', @plateau)
      position.orientation.must_be_instance_of SouthFaced
    end 
    
    it "should be able to set the initial orientation to east" do
      position = Position.new('1 2 E', @plateau)
      position.orientation.must_be_instance_of EastFaced
    end 
    
    it "should be able to set the initial orientation to west" do
      position = Position.new('1 2 W', @plateau)
      position.orientation.must_be_instance_of WestFaced 
    end 
  end 
  
  describe 'rotation' do
    describe 'when the orintetaion is north faced' do
      before do
        @position = Position.new('1 2 N', @plateau)
      end
        
      it "should be able to turn left" do
        @position.turn_left
        @position.orientation.must_be_instance_of WestFaced
      end 
      
      it "should be able to turn right" do
        @position.turn_right
        @position.orientation.must_be_instance_of EastFaced
      end 
      
      it "should be able to move forward" do
        @position.move_forward
        @position.x.must_equal 1
        @position.y.must_equal 3
      end 
    end  
      
    describe 'when the orintetaion is south faced' do
      before do
        @position = Position.new('1 2 S', @plateau)
      end
        
      it "should be able to turn left" do
        @position.turn_left
        @position.orientation.must_be_instance_of EastFaced
      end 
      
      it "should be able to turn right" do
        @position.turn_right
        @position.orientation.must_be_instance_of WestFaced
      end 
        
      it "should be able to move forward" do
        @position.move_forward
        @position.x.must_equal 1
        @position.y.must_equal 1
      end 
    end  
      
    describe 'when the orintetaion is east faced' do
      before do
        @position = Position.new('1 2 E', @plateau)
      end
        
      it "should be able to turn left" do
        @position.turn_left
        @position.orientation.must_be_instance_of NorthFaced
      end 
      
      it "should be able to turn right" do
        @position.turn_right
        @position.orientation.must_be_instance_of SouthFaced
      end 
        
      it "should be able to move forward" do
        @position.move_forward
        @position.x.must_equal 2
        @position.y.must_equal 2
      end 
    end  
      
    describe 'when the orintetaion is west faced' do
      before do
        @position = Position.new('1 2 W', @plateau)
      end
        
      it "should be able to turn left" do
        @position.turn_left
        @position.orientation.must_be_instance_of SouthFaced
      end 
      
      it "should be able to turn right" do
        @position.turn_right
        @position.orientation.must_be_instance_of NorthFaced
      end 
        
      it "should be able to move forward" do
        @position.move_forward
        @position.x.must_equal 0
        @position.y.must_equal 2
      end 
    end
  end 
  
  describe 'on the edge of the plateau' do
    #TODO find if there are some way to match exceptions. Also try moving the code repetation
    it "should not move when on left edge of the plateau and faced east" do
      @position = Position.new('5 2 E', @plateau)
      begin
        @position.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @position.current_position.must_equal '5 2 E'
    end
    
    it "should not move when on left edge of the plateau and faced west" do
      @position = Position.new('0 2 W', @plateau)
      begin
        @position.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @position.current_position.must_equal '0 2 W'
    end
    
    it "should not move when on bottom edge of the plateau and faced south" do
      @position = Position.new('2 0 S', @plateau)
      begin
        @position.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @position.current_position.must_equal '2 0 S'
    end
    
     it "should not move when on top edge of the plateau and faced north" do
      @position = Position.new('2 5 N', @plateau)
      begin
        @position.move_forward
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @position.current_position.must_equal '2 5 N'
    end
  end
end
