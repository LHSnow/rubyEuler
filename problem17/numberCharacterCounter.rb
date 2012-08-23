class Integer
  @@charLengths = [#row is position (from least significant), col is number
    [0,3,3,5,4,4,3,5,5,4],
    [0,3,6,6,5,5,5,7,6,6],
    [0,10,10,12,11,11,10,12,12,11],
    [0,11,0,0,0,0,0,0,0] #one thousand
  ]
    
  def charCount
    this = self
    count = 0
    position = 0
    while this > 0
      reminder = this % 10
      this -= reminder
      this = this / 10
      if ((reminder == 1) && ([4,6,7,9].include? self % 10))
        #[0,3,3,3,4,3,4,4,4,4] special cases for eleven-nineteen
        count += 4
      else
        if((position == 2) && (self % 100 > 0))
          #and when tens/ones are not 00 
          count += 3
        end
        count += @@charLengths[position][reminder]
        #puts "self:#{self},pos:#{position},rem:#{reminder},count:#{count}"
      end
      position += 1
    end
    count
  end
  
end

class Range 
  def charCount
    count = 0
    self.each do |n| 
      count += n.charCount
    end 
    count
  end
end

describe Integer do

  it "should sum one as 3" do
    1.charCount.should == 3
  end
  
  it "should sum two as 3" do
    2.charCount.should == 3
  end
  
  it "should sum three as 5" do
    3.charCount.should == 5
  end
  
  it "should sum four as 4" do
    4.charCount.should == 4
  end
  
  it "should sum five as 4" do
    5.charCount.should == 4
  end
  
  it "should sum six as 3" do
    6.charCount.should == 3
  end
  
  it "should sum seven as 5" do
    7.charCount.should == 5
  end
  
  it "should sum eight as 5" do
    8.charCount.should == 5
  end
  
  it "should sum nine as 4" do
    9.charCount.should == 4
  end
  
  it "should sum ten as 3" do
    10.charCount.should == 3
  end
  
  it "should sum eleven as 6" do
    11.charCount.should == 6
  end
  
  it "should sum twelve as 6" do
    12.charCount.should == 6
  end
  
  it "should sum thirteen as 8" do
    13.charCount.should == 8
  end
  
  it "should sum fourteen as 8" do
    14.charCount.should == 8
  end
  
  it "should sum fifteen as 7" do
    15.charCount.should == 7
  end
  
  it "should sum sixteen as 7" do
    16.charCount.should == 7
  end
  
  it "should sum seventeen as 9" do
    17.charCount.should == 9
  end
  
  it "should sum eighteen as 8" do
    18.charCount.should == 8
  end
  
  it "should sum one hundred and ten as 16" do
    110.charCount.should == 16
  end
  
  it "should sum two hundred as 10" do
    200.charCount.should == 10
  end
  
  it "should sum five hundred as 11" do
    500.charCount.should == 11
  end
  
  it "should sum one thousand as 11" do
    1000.charCount.should == 11
  end

  it "should sum three hundred and forty-two to 23 letters" do
    342.charCount.should == 23
  end
  
  it "should sum one hundred and fifteen to 20 letters" do
    115.charCount.should == 20
  end
  
  it "should sum nine hundred and ninety nine as 24" do
    999.charCount.should == 24
  end
  
end

describe Range do
  it "should sum numbers 1 to 5 to 19 letters" do
    (1..5).charCount.should == 19   
  end
  
  it "should output the sum of the length of the first 1000 numbers" do
    puts (1..1000).charCount
  end
end

