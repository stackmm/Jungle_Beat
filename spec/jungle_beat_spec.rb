require 'rspec'
require './lib/node'
require './lib/linked_list'
require './lib/jungle_beat'

RSpec.describe JungleBeat do
  it "exists" do
    jb = JungleBeat.new
    expect(jb).to be_an_instance_of(JungleBeat)
  end

  it "has readable attributes" do
    jb = JungleBeat.new
    expect(jb.list.head).to be_nil
  end

  it "can append and create multiple nodes from a single string" do
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    expect(jb.list.head.data).to eq("deep")
    expect(jb.list.head.next_node.data).to eq("doo")
    expect(jb.list.head.next_node.next_node.data).to eq("ditt")
    expect(jb.list.to_string).to eq("deep doo ditt")
    expect(jb.list.count).to eq(3)
    jb.append("BOOM beep bAH")
    expect(jb.list.to_string).to eq("deep doo ditt boom beep bah")
    expect(jb.list.count).to eq(6)
    expect(jb.list.includes?("boom")).to be true
    expect(jb.list.includes?("BOOM")).to be false
    expect(jb.list.find(3,3)).to eq("boom beep bah")
    expect(jb.list.find(5,1)).to eq("bah")
    
    jb2 = JungleBeat.new
    jb2.append("     MEOw")
    expect(jb2.list.head.data).to eq("meow")
    expect(jb2.list.count).to eq(1)
    expect(jb2.list.to_string).to eq("meow")
    jb2.append("meow lala    BOOM   ")
    expect(jb2.list.count).to eq(4)
    expect(jb2.list.to_string).to eq("meow meow lala boom")
    expect(jb2.list.includes?("meow")).to be true
    expect(jb2.list.find(0,2)).to eq("meow meow")
  end

  it "can create multiple nodes from a string argument on initilization" do
    jb = JungleBeat.new("deep dop dop deep")
    expect(jb.list.to_string).to eq("deep dop dop deep")
    expect(jb.count).to eq(4)
    jb.append("   BAH xzxz 1")
    expect(jb.list.to_string).to eq("deep dop dop deep bah")
    expect(jb.count).to eq(5)

    jb2 = JungleBeat.new("moop")
    expect(jb2.list.to_string).to eq("moop")
    expect(jb2.count).to eq(1)

    jb3 = JungleBeat.new("")
    expect(jb3.list.to_string).to eq("")
    expect(jb3.count).to eq(0)

    jb4 = JungleBeat.new("        ")
    expect(jb4.list.to_string).to eq("")
    expect(jb4.count).to eq(0)

    jb5 = JungleBeat.new()
    expect(jb5.list.to_string).to eq("")
    expect(jb5.count).to eq(0)
  end

  it "can count the number of elements in the list from the jungle_beat class" do
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    expect(jb.count).to eq(3)
    jb.append("woo hoo shu")
    expect(jb.count).to eq(6)
  end

  it "can validate that input beats before appending" do
    jb = JungleBeat.new
    jb.append("doom deep doo ditt boom BLAH mEOw 24 te")
    expect(jb.list.to_string).to eq("deep doo ditt boom meow")
    expect(jb.count).to eq(5)
    jb.append("3 4 5")
    expect(jb.count).to eq(5)
    jb.append("    SUUU sU    Suu   ")
    expect(jb.list.to_string).to eq("deep doo ditt boom meow suu")
    expect(jb.count).to eq(6)
  end

  it "can change the rate and reset it back to the default value" do 
    jb = JungleBeat.new
    jb.append("deep dop dop deep")
    expect(jb.rate).to eq(500)
    jb.rate = 100
    expect(jb.rate).to eq(100)
    jb.rate = 101
    expect(jb.rate).to eq(101)
    jb.reset_rate
    expect(jb.rate).to eq(500)
    jb.rate = 0
    expect(jb.rate).to eq(0)
  end

  it "can change the voice and reset it back to the default value" do
    jb = JungleBeat.new
    jb.append("deep dop dop deep")
    expect(jb.voice).to eq("Boing")
    jb.voice = "Daniel"
    expect(jb.voice).to eq("Daniel")
    jb.reset_voice
    expect(jb.voice).to eq("Boing")
  end

  # require "pry"; binding.pry
end
