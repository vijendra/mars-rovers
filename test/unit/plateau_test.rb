require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

describe Plateau do
  before do
    @plateau = Plateau.new('5 5')
  end
 
  it "should set the boundary" do
    @plateau.x.must_equal 5
    @plateau.y.must_equal 5
  end
  
  it "should not have any rovers initially" do
    @plateau.rovers.must_be_empty
  end
  
  describe "rovers" do
    it "should be allowed to land" do
      rover = Rover.new('1 2 N', @plateau)
      @plateau.land_a_rover(rover)
      @plateau.rovers.must_include(rover)
    end  
    
    it "should not be allowed to land, if out of boundary" do
      rover = Rover.new('6 2 N', @plateau)
      begin
        @plateau.land_a_rover(rover)
      rescue Exception => e
        e.must_be_instance_of(Exception)
      end
      @plateau.rovers.wont_include(rover)
    end
  end
  
end
