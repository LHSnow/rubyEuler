class Integer
  
  def digitSum
    this = self
    sum = 0
    while this > 0
      rem = this % 10
      sum += rem
      this -= rem
      this = this / 10
    end
    sum
  end
  
end

describe Integer do
  it "should sum the digits of 32768 to 26" do
    32768.digitSum.should == 26
  end
  
  it "should sum the digits of 2^1000" do
    
  end
end
