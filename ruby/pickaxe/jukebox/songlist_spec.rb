require_relative 'song'
require_relative 'songlist'
require_relative 'button'

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
    song = list.with_title("Wish You Were Here")
    expect(song).to eq(@wywh)
  end

  it "can find a song with a word in a title" do
    list = SongList.new()
    list.append(@wywh)
    list.append(@hac)
    song = list.lookup("cigar")
    expect(song).to eq(@hac)
  end

#   it "can create a saved search" do
#     list.create_search('short jazz songs',
#                        :genre => :jazz,
#                        :duration_less_than => 270)
#   end

  it "can import a songlist file" do
    data = <<END
/jazz/j00132.mp3   | 3:45 | Fats Waller         | Ain't Misbehavin'
/jazz/j00319.mp3   | 2:58 | Louis Armstrong     | Wonderful World
/bgrass/bg0732.mp3 | 4:09 | Strength in Numbers | Texas Red
END

    list = SongList.new()
    expect(File).to receive(:open).with("filename","rb") { StringIO.new(data) }
    list.import("filename")
    song = list.with_title("Wonderful World")
    expect(song).not_to be_nil
    expect(song.name).to eq("Wonderful World")
    expect(song.artist).to eq("Louis Armstrong")
    expect(song.duration).to eq(178)
  end
  it "can normalizes artists names" do
    data = <<END
/jazz/j00132.mp3   | 3:45 | fats waller         | Ain't Misbehavin'
END

    list = SongList.new()
    expect(File).to receive(:open).with("filename","rb") { StringIO.new(data) }
    list.import("filename")
    expect(list[0].artist).to eq("Fats Waller")
  end
end
