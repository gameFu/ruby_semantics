require 'spec_helper'

describe If do
  # 赋值
  it "if" do
    staement = If.new(Variable.new(:x), Assign.new(:y, Number.new(1)), Assign.new(:y, Number.new(2)))
    env = {x: Boolean.new(true)}
    expect(staement.reducible?).to eq true
    staement, env = staement.reduce(env)
    staement, env = staement.reduce(env)
    staement, env = staement.reduce(env)
    expect(env[:y].value).to eq 1
  end
end
