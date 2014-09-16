require_relative 'polymorphism'

describe Point do
  it "can be created with x and y coordinates" do
    point = Point.new(10, 20)
    expect(point.x).to eq(10)
    expect(point.y).to eq(20)
  end

  it "can be constructed from a Point" do
    original = Point.new(10, 20)
    copy = Point.new(original)
    expect(copy.x).to eq(10)
    expect(copy.y).to eq(20)
  end

  it "prints the word Point" do
    expect(STDOUT).to receive(:puts).with("Point")
    point = Point.new(10, 20)
    point.print()
  end
end

describe Circle do
  it "can be created with x and y coordinates and a radius" do
    circle = Circle.new(10, 20, 1)
    expect(circle.x).to eq(10)
    expect(circle.y).to eq(20)
    expect(circle.r).to eq(1)
  end

  it "can be created from a Circle" do
    original = Circle.new(10, 20, 1)
    copy = Circle.new(original)
    expect(copy.x).to eq(10)
    expect(copy.y).to eq(20)
    expect(copy.r).to eq(1)
  end

  it "can be created from a Point and a radius" do
    circle = Circle.new(Point.new(10, 20), 1)
    expect(circle.x).to eq(10)
    expect(circle.y).to eq(20)
    expect(circle.r).to eq(1)
  end

  it "prints the word Circle" do
    expect(STDOUT).to receive(:puts).with("Circle")
    circle = Circle.new(10, 20, 1)
    circle.print()
  end
end
