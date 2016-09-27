class Assign < Struct.new(:name, :expression)

  def to_s
    "#{name} = #{expression}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    if expression.reducible?
      [Assign.new(name, expression.reduce(env)), env]
    else
      [DoNothing.new, env.merge({name => expression})]
    end
  end

end
