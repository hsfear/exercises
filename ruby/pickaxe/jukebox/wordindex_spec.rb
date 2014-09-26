require_relative 'wordindex';

describe WordIndex do
  it "indexes an object by words in a provided phrase" do
    index = WordIndex.new()
    index.add_to_index(10, "This is a story")
    index.add_to_index(20, "of a man named Brady")
    expect(index.lookup("story")).to eq(10)
  end

  it "returns nil if the word is not found" do
  end

  it "looks up words regardless of case" do
    index = WordIndex.new()
    index.add_to_index(10, "This is a story")
    expect(index.lookup("this")).to eq(10)
  end

  it "recognizes words with embedded quotes" do
    index = WordIndex.new()
    index.add_to_index(10, "This isn't a story")
    expect(index.lookup("isn't")).to eq(10)
  end

  it "recognizes words with embedded hyphens" do
    index = WordIndex.new()
    index.add_to_index(10, "This isn't a bed-time story")
    expect(index.lookup("bed-time")).to eq(10)
  end
end
