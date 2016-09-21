class Operation < Struct.new(:left, :right)

  # 重写inspect方法，避免打印时出现大量无关信息
  def inspect
    "#{self}"
  end

end
