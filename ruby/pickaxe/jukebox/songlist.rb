class SongList
  def initialize()
    @songs = []
  end

  def self.is_too_long?(song)
    song.duration > 360
  end

  def [](key)
    @songs[key]
  end

  def count()
    @songs.length
  end

  def append(song)
    @songs << song
  end

  def delete_first()
    @songs.shift
  end

  def delete_last()
    @songs.pop
  end

  def with_title(title)
    @songs.find { | song | song.name == title }
  end

  class Importer
  end
end

