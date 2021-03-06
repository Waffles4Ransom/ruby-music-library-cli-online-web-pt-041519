require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
    input = gets.strip
    
    case input
    when 'list songs'
      list_songs
    when 'list artists'
      list_artists
    when 'list genres'
      list_genres
    when 'list artist'
      list_songs_by_artist
    when 'list genre'
      list_songs_by_genre
    when 'play song'
        play_song
    when 'exit'
      return 
    else 
      call
    end 
  end 
  
  def list_songs
    Song.all.sort_by{|song| song.name}.each.with_index(1) do |song, i| 
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    Artist.all.sort_by{|a| a.name}.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end 
  end 
  
  def list_genres
    Genre.all.sort_by{|g| g.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip 
    if a = Artist.find_by_name(input_artist)
      a.songs.sort_by{|s| s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.name} - #{song.genre.name}"
      end 
    end
  end 
   
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.strip
    if g = Genre.find_by_name(input_genre)
      g.songs.sort_by{|s| s.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end 
  
  def play_song 
    puts "Which song number would you like to play?"
    list = Song.all.sort_by{|song| song.name}
    song_input = gets.strip.to_i
    if (1..list.size).include?(song_input)
    song_request = list[song_input - 1]
      puts "Playing #{song_request.name} by #{song_request.artist.name}"
    end
  end 
  
  
end 