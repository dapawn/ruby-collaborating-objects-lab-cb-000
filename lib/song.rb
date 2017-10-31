require "pry"
class Song
  attr_accessor :name, :artist_name, :artist
  @@all = []

  def initialize(name)
    @name = name
  end

    def artist_name=(name)
      binding.pry
      if (self.artist.nil?)
        self.artist = Artist.new(name)
      else
        self.artist.name = name
      end
    end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      @@all << self.new
      @@all.last
  end

  def self.new_by_filename(filename)
    name = filename.split(" - ")[1]
    song = self.new(name)
    song
  end

  def self.new_by_name(name)
      song =  self.new
      song.name = name
      song
  end

  def self.create_by_name(name)
      song = self.create
      song.name = name
      song
  end

  def self.find_by_name(name)
    @@all[name] if name = @@all.find_index { |s| s.name == name }
    artist_name = filename.split(" - ")[2]
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file)
    info = file.match(/(.*) - (.*)\.mp3/)
    s = new_by_name(info[2])
    s.artist_name = info[1]
    #binding.pry
    s
  end

  def self.create_from_filename(file)
    info = file.match(/(.*) - (.*)\.mp3/)
    s = create_by_name(info[2])
    s.artist_name = info[1]
    #binding.pry
    s
  end
  def self.destroy_all
     @@all.clear
  end
end
