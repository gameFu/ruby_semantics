require 'spec_helper'

describe Variable do
  it "variable" do
    num = Add.new( Variable.new(:x), Variable.new(:y)).reduce({x: Number.new(3), y: Number.new(4)}).reduce({x: Number.new(3), y: Number.new(4)}).reduce(({x: Number.new(3), y: Number.new(4)}))
    expect(num.value).to eq(7)
  end
end
