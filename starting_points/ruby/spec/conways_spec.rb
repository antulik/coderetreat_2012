require 'spec_helper'
require 'conways'
require 'set'


class World < Set

  def tick
    new_set = self.to_set

    if length <= 2
      new_set.clear
    else
      new_set << [1, 1]
    end
    new_set
  end

  def create_hood(elem)
    (-1..1).to_a.map do |x|
      (-1..1).to_a.map do |y|
        [x+elem[0], y+elem[1]]
      end
    end.flatten(1).to_set
  end

  def get_live_hood elem
    st = create_hood(elem)
    st = st & self

    st.delete(elem)
    st
  end

  def self.is_alive?(hood, current_state)
    case hood.length
      when 3
        return true
      when 2
        return current_state
      else
        return false
    end
  end

end

describe "conways" do
  it "kills a single cell" do
    w   = World.new([0, 0])
    w_n = w.tick

    w_n.should be_empty
  end

  it "creates new cell near 3 cells" do
    w   = World.new([[0, 0], [0, 1], [1, 0]])
    w_n = w.tick

    w_n.should == [[0, 0], [0, 1], [1, 0], [1, 1]].to_set
  end

  it "kills two cells" do
    w   = World.new [[0, 0], [0, 1]]
    w_n = w.tick

    w_n.should == [].to_set
  end

  it "creates a neighborhood" do
    w = World.new [[0, 0]]
    n = w.create_hood([0, 0])
    n.should == [[-1, -1], [-1, 0], [-1, 1], [0, 0], [1, 1], [0, -1], [0, 1], [1, -1], [1, 0]].to_set
  end

  it "returns neighbourhood" do
    w = World.new [[0, 0], [1, 1]]

    w.get_live_hood([1,1]).should == [[0,0]].to_set
  end

  it "determine if live" do
    w = World.new [[0,0]]
    World::is_alive?(w.get_live_hood([1,1]), true).should be_false
  end

end
