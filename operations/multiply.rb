require_relative './operation.rb'
class Multiply < Operation

  def to_s
    "#{left} * #{right}"
  end

  def reduce
    super(self.class)
  end

  def self.operator
    "*"
  end


end
