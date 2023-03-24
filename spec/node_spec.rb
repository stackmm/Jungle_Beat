require 'rspec'
require './lib/node'

RSpec.describe Node do
  it "exists" do
    node = Node.new("plop")
    expect(node).to be_an_instance_of(Node)
  end

  it "has readable attributes" do
    node = Node.new("plop")
    expect(node.data).to eq("plop")
    expect(node.next_node).to eq(nil)
  end

  # require "pry"; binding.pry
end