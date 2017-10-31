class Artist
  @@song_count = 0
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  #  self.save
  end

  def self.all
    @@all
  end

  def self.create_by_name(name)
      artist = self.new(name)
      @@all << artist
      artist
  end

  def self.find_by_name(name)
    @@all[name] if name = @@all.find_index { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def save
    self.class.all << self unless self.class.all.any? {|a| a.name == self.name}
  end

  def songs
    @songs
  end

  def add_song_by_name(name)
    song = Song.new(name)
    add_song(song)
  end

  def self.song_count
    @@song_count
  end

  def print_songs
    @songs.each {|s| puts s.name}
  end




end
