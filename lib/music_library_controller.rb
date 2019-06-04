class MusicLibraryController

  def initialize(path = './db/mp3s')
    new_object = MusicImporter.new(path)
    new_object.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp until input == "exit"
  end

  def list_songs
    sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
    sorted_songs.each.with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    # Song.all.sort{|a, b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
    sorted_artists.each.with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
  end
  
  def list_genres
    sorted_genres = Genre.all.sort{|a, b| a.name <=> b.name}
    sorted_genres.each.with_index{|genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
  end
end