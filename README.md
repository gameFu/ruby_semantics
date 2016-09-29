# ruby_semantics

ruby实现的简单计算机

## Machine

一个简单的计算机类，包含当前运行的计算和计算的环境

## 简单的语言

### 数据类型

number

Number.new(1)

```ruby

boolean

Boolean.new(true)

```

### 变量

变量值来自于运算时的环境， 相当于ruby中的 变量x

```ruby

  Variable.new(:x)

```

### 运算

运算要包含运算的环境才能进行运算，有加法，乘法，小于。。。

加法， 相当于ruby中的 1 + 2

```ruby

  Add.new(Number.new(1), Number.new(2)).reduce({})

```


### 语句

语句，是一个表达式，用来求值生成另一个表达式，换句话说，一个语句能够抽象改变这个机器的状态。而机器唯一的状态就是当前的环境

1.最简单的语句 --  什么都不做的语句

即当所有语句都执行（规约）完成后产生的语句

```ruby

DoNothing.new

```

2. 赋值语句

类似于ruby中的 x = 1

赋值语句的作用是不仅能改变当前变量的值，也要把变量的新值写到环境中

下面的语句等同于 ruby中的 x = 1 + 1

```ruby

Machine.new(
  Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
  {x: Number.new(2)}
).run

```

3. 判断语句

类似于ruby中的if

下面语句等同于ruby中的 if (x) { y = 1} else { y=2 }, 执行这条语句的环境是 x = true

``` ruby

Machine.new(
  If.new(Variable.new(:x), Assign.new(:y, Number.new(1)), Assign.new(:y, Number.new(2))),
  {x: Boolean.new(true)}
).run

```


4. 序列

能同时执行多条语句， 类似于ruby中的 x = 1 + 2, y = x + 3

``` ruby
staement = Sequence.new(Assign.new(:x, Add.new(Number.new(1), Number.new(2))), Assign.new(:y, Add.new(Variable.new(:x), Number.new(3))))
env = {x: Boolean.new(true)}

Machine.new(
  staement = Sequence.new(Assign.new(:x, Add.new(Number.new(1), Number.new(2))), Assign.new(:y, Add.new(Variable.new(:x), Number.new(3))))，
  env = {x: Boolean.new(true)}
).run

```

执行的效果
```
y = x + 3, {:x=>3}
y = 3 + 3, {:x=>3}
y = 6, {:x=>3}
do-nothing, {:x=>3, :y=>6}

```

5. while语句

循环结构，类似于ruby中的where

```ruby

Machine.new(
  While.new(
   LessThan.new(Variable.new(:x), Number.new(5)),
   Assign.new(:x,
    Add.new(Variable.new(:x), Number.new(3) )
    )
  ),
  {x: Number.new(1)}
).run


```
