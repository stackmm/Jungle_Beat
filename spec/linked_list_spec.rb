require 'rspec'
require './lib/node'
require './lib/linked_list'

RSpec.describe LinkedList do
  it "exists" do
    list = LinkedList.new
    expect(list).to be_an_instance_of(LinkedList)
  end

  it "has readable attributes" do
    list = LinkedList.new
    expect(list.head).to eq(nil)
  end

  it "can append a new piece of data" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.data).to eq("doop")
    list.append(0)
    expect(list.head.data).to eq(0)
    list.append(false)
    expect(list.head.data).to eq(false)

    expect(list.head.next_node).to eq(nil)
  end

  it "can count the number of elements in a list" do
    list = LinkedList.new
    list.append("doop")
    expect(list.count).to eq(1)
  end

  it "can generate a string of all the elements in the list" do
    list = LinkedList.new
    list.append("doop")
    expect(list.to_string).to eq("doop")
  end

  # require "pry"; binding.pry
end