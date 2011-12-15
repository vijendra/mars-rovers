require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

describe Orientation do  
  describe 'all instances should be of type Orientation' do
    it "should be of type Orientation" do
      NorthFaced.new.must_be_kind_of Orientation
      SouthFaced.new.must_be_kind_of Orientation
      EastFaced.new.must_be_kind_of Orientation
      WestFaced.new.must_be_kind_of Orientation
    end
  end
 
  describe 'north faced' do
    before do
      @orientation = NorthFaced.new
    end
    
    it "should be west faced when turns left" do
      @orientation.turn_left.must_be_instance_of WestFaced
    end 
      
    it "should be east faced when turns right" do
      @orientation.turn_right.must_be_instance_of EastFaced
    end 
        
    it "should add one to y co-ordinate when moved ahead" do
      @orientation.move_forward[1].must_equal 1
    end 
    
    it "should not change x co-ordinate when moved ahead" do
      @orientation.move_forward[0].must_equal 0
    end
  end 
      
  describe 'south faced' do
    before do
      @orientation = SouthFaced.new
    end
    
    it "should be east faced when turns left" do
      @orientation.turn_left.must_be_instance_of EastFaced
    end 
      
    it "should be west faced when turns right" do
      @orientation.turn_right.must_be_instance_of WestFaced
    end 
        
    it "should reduce one from y co-ordinate when moved ahead" do
      @orientation.move_forward[1].must_equal -1
    end 
    
    it "should not change x co-ordinate when moved ahead" do
      @orientation.move_forward[0].must_equal 0
    end
  end  
      
  describe 'east faced' do
    before do
      @orientation = EastFaced.new
    end
    
    it "should be north faced when turns left" do
      @orientation.turn_left.must_be_instance_of NorthFaced
    end 
      
    it "should be south faced when turns right" do
      @orientation.turn_right.must_be_instance_of SouthFaced
    end 
        
    it "should add one to x co-ordinate when moved ahead" do
      @orientation.move_forward[0].must_equal 1
    end 
    
    it "should not change y co-ordinate when moved ahead" do
      @orientation.move_forward[1].must_equal 0
    end
 
  end  
      
  describe 'west faced' do
    before do
      @orientation = WestFaced.new
    end
    
    it "should be south faced when turns left" do
      @orientation.turn_left.must_be_instance_of SouthFaced
    end 
      
    it "should be north faced when turns right" do
      @orientation.turn_right.must_be_instance_of NorthFaced
    end 
        
    it "should reduce one from x co-ordinate when moved ahead" do
      @orientation.move_forward[0].must_equal -1
    end 
    
    it "should not change y co-ordinate when moved ahead" do
      @orientation.move_forward[1].must_equal 0
    end
 
  end  
 
end 


