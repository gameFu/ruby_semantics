require 'spec_helper'

describe Variable do
  it "variable" do
    num =  Machine.new(
      Add.new( Variable.new(:x), Variable.new(:y)),
      {x: Number.new(3), y: Number.new(4)}
    ).run
    expect(num.value).to eq(7)
  end
end
