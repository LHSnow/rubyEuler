class Integer
  def prime?
    return true if self == 2
    return false if self.even?
    
    root = Math.sqrt(self)
    return false if root.to_i == root
    
    root.to_i.downto(3) { |n|
      return false if n.gcd(self) > 1
    } 
    return true;
  end
  
end


describe Integer do
  it "should say 2 is prime" do
    2.prime?.should == true
  end
  
  it "should say 3 is prime" do
    3.prime?.should == true
  end
  
  it "should say 4 is not prime" do
    4.prime?.should == false
  end
  
  it "should say 5 is prime" do
    5.prime?.should == true
  end  
  
  it "should find the 10001st prime number" do
    count = 0
    number = 1
    while count < 10000
      number += 2
      count += 1 if number.prime?
    end
    puts number
  end
end

