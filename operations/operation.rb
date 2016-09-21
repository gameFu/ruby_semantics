class Operation < Struct.new(:left, :right)

  # 重写inspect方法，避免打印时出现大量无关信息
  def inspect
    "#{self}"
  end

  # 是否能进行规约
  def reducible?
    true
  end

  def reduce(operation)
    if left.reducible?
      operation.new(left.reduce, right)
    elsif right.reducible?
      operation.new(left, right.reduce)
    else
      Number.new(left.value.send(operation.operator, right.value))
    end

  end

end
