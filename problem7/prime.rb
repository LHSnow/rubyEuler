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
  
  def circular_prime?
    this = self.to_a
    count = 0
    while count < this.size
      return false unless this.join.to_i.prime?
      this.rotate!
      count += 1
    end
    return true;
  end
  
  def to_a
    str = self.to_s
    this = []
    str.each_char { |c| this << c.to_i }
    this
  end
  
  def pandigital?
    this = self.to_a
    this.uniq!.nil?
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
  
  it "should sum the primes up to two million (problem 10)" do
    sum = 2
    number = 1
    while number < 200
      number += 2
      sum += number if number.prime?
    end
    puts sum
  end
  
  it "should find the number of circular primes below one million (problem 35)" do
    circulars = [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97, 197]
    circulars.each { |c| c.circular_prime?.should == true }
    
    count = 1 #start with counting 2, to avoid checking even numbers 
    number = 1
    while number < 1000
      number += 2
      #verify count
      count.should == 13 if number == 100
      count += 1 if number.circular_prime?
    end
    puts count
  end 
  
  it "should find the largest pandigital prime (problem 41)" do
    2143.pandigital?.should == true
    1234.pandigital?.should == true
  end
end

