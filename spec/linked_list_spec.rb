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

  it "can append one new piece of data" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node).to eq(nil)
  end

  it "can count the number of elements in a list of length one" do
    list = LinkedList.new
    list.append("doop")
    expect(list.count).to eq(1)
  end

  # it "can generate a string of all the elements in the list of length one" do
  #   list = LinkedList.new
  #   list.append("doop")
  #   require "pry"; binding.pry
  #   expect(list.to_string).to eq("doop")
  
  # end

  it "can append multiple pieces of data in to the list" do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node.data).to eq("deep")
    expect(list.head.next_node.next_node).to eq(nil)
    expect(list.count).to eq(2)
    require "pry"; binding.pry


  end

  # require "pry"; binding.pry
end