require_relative './operation.rb'

class LessThan < Operation

  def to_s
    "#{left} < #{right}"
  end

  def reduce(env)
    super(self.class, env)
  end

  def self.operator
    "<"
  end

  def self.operator_class
    Boolean
  end

end
