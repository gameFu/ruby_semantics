require 'spec_helper'

describe Sequence do
  # 赋值
  it "sequence" do
    staement = Sequence.new(Assign.new(:x, Add.new(Number.new(1), Number.new(2))), Assign.new(:y, Add.new(Variable.new(:x), Number.new(3))))
    env = {x: Boolean.new(true)}
    expect(staement.reducible?).to eq true
    6.times do |t|
      staement, env = staement.reduce(env)
    end
    expect(env[:y].value).to eq 6
  end
end
