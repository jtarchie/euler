require 'mathn'
class String
  def fromLeft
    (0..(self.length - 1)).collect do |i|
      self[i..-1]
    end
  end

  def fromRight
    (0..(self.length - 1)).collect do |i|
      self[0..self.length-i-1]
    end
  end
end

class Integer
  def truncatable?
    string = self.to_s
    return false if string =~ /0/
    string.fromLeft.all? do |num|
      Prime::instance.prime?(num.to_i)
    end && string.fromRight.all? do |num|
      Prime::instance.prime?(num.to_i)
    end
  end
end

truncatables = []

Prime::instance.each do |prime|
  truncatables << prime if prime.truncatable?
  break if truncatables.length == 15
end


puts truncatables.inspect
puts truncatables[4..-1].reduce(:+)
