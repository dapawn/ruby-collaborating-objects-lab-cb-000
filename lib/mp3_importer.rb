require "pry"

class MP3Importer

  def initialize(path)
    @path = path
  end

  attr_accessor :path

  def files
    Dir["#{path}/*.mp3"].collect {|f| f.sub(/.*\//,"")}
  end

  def import
    files.each{ |filename| Song.new_by_filename(filename) }
  end

end
