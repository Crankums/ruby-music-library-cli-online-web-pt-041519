class MusicImporter

  attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries('./spec/fixtures/mp3s').select {|f| !File.directory? f}
  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end


end