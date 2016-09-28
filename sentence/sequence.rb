# x = 1 + 1; y = x + 2; z = x + y 能执行多条语句的语句
class Sequence < Struct.new(:first, :second)

  def to_s
    "#{first}; #{second}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    case first
    when DoNothing.new
      [second, env]
    else
      reduce_first, reduce_env = first.reduce(env)
      [Sequence.new(reduce_first, second), reduce_env]
    end
  end

end
