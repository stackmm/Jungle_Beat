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
    expect(node.next_node).to be_nil
    
    node2 = Node.new("")
    expect(node2.data).to eq("")
    expect(node2.next_node).to be_nil

    node3 = Node.new(-3)
    expect(node3.data).to eq(-3)
    expect(node3.next_node).to be_nil

    node4 = Node.new(false)
    expect(node4.data).to be false
    expect(node4.next_node).to be_nil
  end
end