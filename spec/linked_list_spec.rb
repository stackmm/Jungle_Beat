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
  end

end