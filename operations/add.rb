require_relative './operation.rb'
class Add < Operation

  def to_s
    "#{left} + #{right}"
  end

  def reduce(env)
    super(self.class, env)
  end

  def self.operator
    "+"
  end

  def self.operator_class
    Number
  end

end
