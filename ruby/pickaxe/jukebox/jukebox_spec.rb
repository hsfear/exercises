require_relative 'song'
require_relative 'songlist'
require_relative 'button'

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

describe SongList do
  before(:each) do
    Song.reset_plays
    @wywh = Song.new("Wish You Were Here", "Pink Floyd", 317)
    @hac = Song.new("Have a Cigar", "Pink Floyd", 324)
    @wttm = Song.new("Welcome to the Machine", "Pink Floyd", 450)
  end
  it "rejects songs > 6 minutes" do
    expect(SongList.is_too_long?(@wttm)).to eq(true)
  end

  it "appends a song to the list" do
    list = SongList.new()
    list.append(@wywh)
    expect(list[0].name).to eq("Wish You Were Here")
  end

  it "can delete the fist song in the list" do
    list = SongList.new()
    list.append(@wywh)
    list.append(@hac)
    list.delete_first()
    expect(list[0].name).to eq("Have a Cigar")
  end

  it "can delete the last song in the list" do
    list = SongList.new()
    list.append(@wywh)
    list.append(@hac)
    list.delete_last()
    expect(list[0].name).to eq("Wish You Were Here")
    expect(list.count).to eq(1)
  end

  it "can find a song with a particular title" do
    list = SongList.new()
    list.append(@wywh)
    list.append(@hac)
    song = list.with_title("Have a Cigar")
    expect(song).to eq(@hac)
  end
end

describe SongList::Importer do
  it "can import a songlist file" do
    @data = <<END
/jazz/j00132.mp3   | 3:45 | Fats Waller         | Ain't Misbehavin'
/jazz/j00319.mp3   | 2:58 | Louis Armstrong     | Wonderful World
/bgrass/bg0732.mp3 | 4:09 | Strength in Numbers | Texas Red
    END

    list = SongList.new()
    File.stub(:open).with("filename","rb") { StringIO.new(data) }
    list.import("filename")
    song = list.with_title("Wonderful World")
    expect(song.name).to eq("Wonderful World")
    expect(song.artist).to eq("Louis Armstrong")
    expect(song.duration).to eq(178)
  end
end

describe Button do
  it "has a label" do
    button = Button.new("button")
    expect(button.label).to eq("button")
  end
end

describe JukeboxButton do
  it "extends button" do
    button = JukeboxButton.new("button") { }
    expect(button.label).to eq("button")
  end

  it "runs the provided action when the button is pressed" do
    pressed = false
    button = JukeboxButton.new("button") { pressed = true }
    button.press()
    expect(pressed).to eq(true)
  end

end
