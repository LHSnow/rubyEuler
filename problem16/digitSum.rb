class Integer
  
  def digitSum
    0
  end
  
end

describe Integer do
  it "should sum the digits of 32768 to 26" do
    32768.digitSum.should == 26
  end
end
