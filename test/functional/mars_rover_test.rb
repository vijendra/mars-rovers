describe "mars rover should be able to process the instructions properly" do 
  before do
    @plateau = Plateau.new('5 5')
  end
  
  it "should be in position '1 3 N' when initial position is '1 2 N' and moving instruction is 'LMLMLMLMM'" do
    rover = Rover.new('1 2 N', @plateau)
    rover.process_instructions('LMLMLMLMM')
    rover.current_position.must_equal '1 3 N'
  end
    
  it "should be in position '5 1 E' when initial position is is '3 3 E' and moving instruction is 'MMRMMRMRRM'" do
    rover = Rover.new('3 3 E', @plateau)
    rover.process_instructions('MMRMMRMRRM')
    rover.current_position.must_equal '5 1 E'
  end
  
  #TODO check if we need to add tests for more conditions
end  
