# 什么功能都不提供的语句
class DoNothing
  def to_s
    'do-nothing'
  end

  def inspect
    "#{self}"
  end

  # 由于没有继承struct类，所以，必须手动定义
  def ==(other_statement)
    other_statement.instance_of?(DoNothing)
  end

  def reducible?
    false
  end

end
