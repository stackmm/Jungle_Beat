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

  it "can generate a string of all the elements in the list of length one" do
    list = LinkedList.new
    list.append("doop")
    expect(list.to_string).to eq("doop")
  end

  it "can append multiple pieces of data in to the list" do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node.data).to eq("deep")
    expect(list.head.next_node.next_node).to eq(nil)
    expect(list.count).to eq(2)
    expect(list.to_string).to eq("doop deep")
  end

  it "can prepend nodes to the beginning of the list" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.count).to eq(3)
    expect(list.to_string).to eq("dop plop suu")
  end

  it "can insert one or more elements at a given position in the list" do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    expect(list.count).to eq(4)
    expect(list.to_string).to eq("dop woo plop suu")

    list2 = LinkedList.new
    list2.append("beep")
    list2.insert(1, "boop")
    expect(list2.count).to eq(2)
    expect(list2.to_string).to eq("beep boop")
    list2.insert(0, "meow")
    expect(list2.count). to eq(3)
    expect(list2.to_string).to eq("meow beep boop")
    list2.insert(3, "moop")
    expect(list2.count). to eq(4)
    expect(list2.to_string).to eq("meow beep boop moop")

    list3 = LinkedList.new
    list3.insert(0, "boom")
    expect(list3.count).to eq(1)
    expect(list3.to_string).to eq("boom")
    list3.prepend("vroom")
    expect(list3.count).to eq(2)
    expect(list3.to_string).to eq("vroom boom")
    list3.append("meow")
    expect(list3.count).to eq(3)
    expect(list3.to_string).to eq("vroom boom meow")
    # require "pry"; binding.pry
  end

end