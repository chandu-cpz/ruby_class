class MusicPlaylist
  def initialize
    @playlist = []
  end

  def add_song(title, artist, genre)
    @playlist << Song.new(title, artist, genre)
  end

  def shuffle_and_play
    shuffled_playlist = @playlist.shuffle
    shuffled_playlist.each { |song| puts "Playing: #{song}" }
  end
end

class Song
  attr_accessor :title, :artist, :genre

  def initialize(title, artist, genre)
    @title = title
    @artist = artist
    @genre = genre
  end

  def to_s
    "Title: #{@title}, Artist: #{@artist}, Genre: #{@genre}"
  end
end

playlist = MusicPlaylist.new
playlist.add_song("Song 1", "Chandrakanth", "Rock")
playlist.add_song("Song 2", "Chaitanya", "Pop")
playlist.add_song("Song 3", "Jogi", "Jazz")

puts "Shuffling and Playing Playlist:"
playlist.shuffle_and_play
