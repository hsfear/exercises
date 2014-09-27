require_relative 'wordindex'

class SongList
  def initialize()
    @songs = []
    @index = WordIndex.new()
  end

  def self.is_too_long?(song)
    song.duration > 360
  end

  def [](key)
    @songs[key]
  end

  def each
    @songs.each { | song | yield song }
  end

  def count()
    @songs.length
  end

  def append(song)
    @songs << song
    @index.add_to_index(song, song.name)
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

  def lookup(word)
    @index.lookup(word)
  end

  def import(filename)
    File.open(filename, "rb").each do |line|
      (path, time, artist, title) = line.chop.split(/\s+\|\s+/)
      append(Song.new(title, artist.gsub(/\w+/, &:capitalize), timeToMinutes(time)))
    end
  end

  def timeToMinutes(time)
    (minutes, seconds) = time.split(':')
    minutes.to_i * 60 + seconds.to_i
  end

end

