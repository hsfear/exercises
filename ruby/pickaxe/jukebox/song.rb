class Song
  attr_reader :name, :artist, :duration, :plays

  @@plays = 0

  def Song.plays
    @@plays
  end

  def Song.reset_plays
    @@plays = 0
  end

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
  end

  def play
    @plays += 1
    @@plays += 1
  end
end

