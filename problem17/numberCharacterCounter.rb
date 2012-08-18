class Integer
  
  def charLength(number)
    lengths = {
      0 => 0,
      1 => 3, #one
      2 => 3, #two
      3 => 5,
      4 => 4,
      5 => 4,
      6 => 3,
      7 => 5,
      8 => 5,
      9 => 4,
      10 => 3,
      11 => 6, #eleven
      12 => 6,
      13 => 8, #thirteen
      14 => 8,
      15 => 7,
      16 => 7,
      17 => 9,
      18 => 8,
      19 => 8,
      20 => 6, #twenty
      30 => 6, #thirty
      40 => 6, #fourty
      50 => 5, #fifty
      60 => 5,
      70 => 7, #seventy
      80 => 6, #eighty
      90 => 6, #ninety
      100 => 7, #hundred
      1000 => 8 #thousand
    }
    lengths[number]
  end
      
  def charCount
    
    #thousands = self / 1000
    #hundreds = self / 100
    #tens = self / 10 % 10
    #ones = self / 10
    
    
    
    #charLength[self]
  end
  
  def ones
    charLength (self % 10)
  end
  
  def tens
    charLength (self / 10 % 10)
  end
  
  def thousands
    number = self / 1000
    if number > 0
      charLength(number) + charLength(1000)
    end
  end
  
end

describe Integer do

  it "should sum one as 3" do
    1.ones.should == 3
  end
  
  it "should sum 11 as 

  it "should sum one thousand as 11" do
    1000.thousands.should == 11
  end

  it "should sum three hundred and forty-two to 23 letters" do
    342.charCount.should == 23
  end
  
  it "should sum one hundred and fifteen to 20 letters" do
    115.charCount.should == 20
  end
  
  it "should sum numbers 1 to 5 to 19 letters" do
    
  end
  
  it "should output the sum of the length of the first 1000 numbers" do
  
  end
end


