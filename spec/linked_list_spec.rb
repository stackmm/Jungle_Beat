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
    expect(list.head).to be_nil
  end

  it "can append data to a list" do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node).to be_nil

    list.append("deep")
    expect(list.head.data).to eq("doop")
    expect(list.head.next_node.data).to eq("deep")
    expect(list.head.next_node.next_node).to be_nil
    expect(list.count).to eq(2)
    expect(list.to_string).to eq("doop deep")

    list.append(false)
    expect(list.head.next_node.next_node.data).to be false
    expect(list.head.next_node.next_node.next_node).to be_nil
    expect(list.count).to eq(3)
    expect(list.to_string).to eq("doop deep false")
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
  end

  it "can find a position in the list and return a certain number of elements" do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    expect(list.find(2,1)).to eq("shi")
    expect(list.find(1,3)).to eq("woo shi shu")
    expect(list.find(0,0)).to eq("")
    expect(list.find(0,3)).to eq("deep woo shi")
    expect(list.find(0,5)).to eq("deep woo shi shu blop")
    expect(list.find(4,1)).to eq("blop")
    expect(list.find(4,0)).to eq("")
  end

  it "can pop(remove) an element from the end of the list" do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    expect(list.pop).to eq("blop")
    expect(list.count).to eq(4)
    expect(list.to_string).to eq("deep woo shi shu")
    expect(list.pop).to eq("shu")
    expect(list.count).to eq(3)
    expect(list.to_string).to eq("deep woo shi")
    expect(list.pop).to eq("shi")
    expect(list.count).to eq(2)
    expect(list.to_string).to eq("deep woo")
    expect(list.pop).to eq("woo")
    expect(list.count).to eq(1)
    expect(list.to_string).to eq("deep")
    expect(list.pop).to eq("deep")
    expect(list.count).to eq(0)
    expect(list.to_string).to eq("")
  end

  it "can check if a supplied value is in the list" do
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")
    expect(list.includes?("deep")).to be true
    expect(list.includes?("dep")).to be false
    expect(list.includes?("woo")).to be true
    expect(list.includes?("wow")).to be false
    expect(list.includes?("shu")).to be true
    expect(list.includes?("blop")).to be true
    expect(list.includes?("")).to be false
    expect(list.includes?("deep woo shi shu blop")).to be false
    list.pop
    expect(list.includes?("blop")).to be false
    list.append("blop")
    expect(list.includes?("blop")).to be true
  end
  
  # require "pry"; binding.pry
end