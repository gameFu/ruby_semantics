require_relative './operation.rb'
class Add < Operation

  def to_s
    "#{left} + #{right}"
  end

end
