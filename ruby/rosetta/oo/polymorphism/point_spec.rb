require_relative 'point'

describe Point do
  it "is created with x and y coordinates" do
    point = Point.new(10, 20)
    expect(point.x).to eq(10)
    expect(point.y).to eq(20)
  end

  it "prints the word Point" do
    STDOUT.should_receive(:puts).with("Point")
    point = Point.new(10, 20)
    point.print()
  end
end
