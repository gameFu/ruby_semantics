require 'spec_helper'

describe Assign do
  # 赋值
  it "assign" do
    staement = Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))
    env = {x: Number.new(2)}
    expect(staement.reducible?).to eq true
    staement, env = staement.reduce(env)
    staement, env = staement.reduce(env)
    staement, env = staement.reduce(env)
    expect(env[:x].value).to eq 3
  end
end
