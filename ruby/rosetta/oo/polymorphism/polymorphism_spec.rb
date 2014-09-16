require_relative 'polymorphism'

describe Point do
  it "is created with x and y coordinates" do
    point = Point.new(10, 20)
    expect(point.x).to eq(10)
    expect(point.y).to eq(20)
  end

  it "is can change x and y coordinates" do
    point = Point.new(10, 20)
    point.x = 30
    point.y = 40
    expect(point.x).to eq(30)
    expect(point.y).to eq(40)
  end

  it "prints the word Point" do
    expect(STDOUT).to receive(:puts).with("Point")
    point = Point.new(10, 20)
    point.print()
  end

  it "has a clone method that creates a new copy of the object" do
    original = Point.new(10, 20)
    clone = Point.newCopy(original)
    original.x = 30
    expect(clone.x).to eq(10)
    expect(clone.y).to eq(20)
  end
end

describe Circle do
  it "extends circle" do
    circle = Circle.new(10, 20, 1)
    expect(circle.x).to eq(10)
    expect(circle.y).to eq(20)
    expect(circle.r).to eq(1)
  end

  it "is can change x and y coordinates" do
    circle = Circle.new(10, 20, 1)
    circle.x = 30
    circle.y = 40
    expect(circle.x).to eq(30)
    expect(circle.y).to eq(40)
  end

  it "is can change its radius" do
    circle = Circle.new(10, 20, 1)
    circle.x = 30
    circle.y = 40
    expect(circle.x).to eq(30)
    expect(circle.y).to eq(40)
  end

  it "prints the word Circle" do
    expect(STDOUT).to receive(:puts).with("Circle")
    circle = Circle.new(10, 20, 1)
    circle.print()
  end

  it "has a clone method that creates a new copy of the object" do
    original = Circle.new(10, 20, 1)
    clone = Circle.newCopy(original)
    original.x = 30
    expect(clone.x).to eq(10)
    expect(clone.y).to eq(20)
    expect(clone.r).to eq(1)
  end
end
