require_relative './operation.rb'
class Multiply < Operation

  def to_s
    "#{left} * #{right}"
  end

end
