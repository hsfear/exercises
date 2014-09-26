require_relative 'song'

describe Song do
  before(:each) do
    Song.reset_plays
    @wywh = Song.new("Wish You Were Here", "Pink Floyd", 317)
    @hac = Song.new("Have a Cigar", "Pink Floyd", 324)
  end

  it "has name, artist, and duration" do
    expect(@wywh.name).to eq("Wish You Were Here")
    expect(@wywh.artist).to eq("Pink Floyd")
    expect(@wywh.duration).to eq(317)
  end
  it "keeps track of the number of times a song has been played" do
    @wywh.play
    expect(@wywh.plays).to eq(1)
  end
  it "keeps track of the number of times all songs have been played" do
    @wywh.play
    @hac.play
    expect(Song.plays).to eq(2)
  end
end
