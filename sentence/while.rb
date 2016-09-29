class While < Struct.new(:condition, :body)

  def to_s
    "while (#{condition}) {#{body}}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    [If.new(condition, Sequence.new(body, self), DoNothing.new), env]
  end

end
