require_relative './operation.rb'
class Multiply < Operation

  def to_s
    "#{left} * #{right}"
  end

  def reduce(env)
    super(self.class, env)
  end

  def self.operator
    "*"
  end


end
