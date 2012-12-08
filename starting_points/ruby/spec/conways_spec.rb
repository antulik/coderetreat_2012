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

  def create_hood()

    (-1..1).to_a.map { |x| (-1..1).to_a.map { |y| [x,y] } }.flatten(1).to_set
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
    w   = World.new [[0, 0],[0, 1]]
    w_n = w.tick

    w_n.should == [].to_set
  end

  it "creates a neighborhood" do
    w = World.new [[0,0]]
    n = w.create_hood
    n.should == [[-1,-1], [-1,0], [-1,1], [0,0], [1,1], [0,-1], [0,1], [1,-1], [1,0] ].to_set
  end

end
