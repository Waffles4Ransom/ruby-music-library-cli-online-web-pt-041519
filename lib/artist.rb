class Artist 
  extend Concerns::Findable
   attr_accessor :name
   attr_reader :songs
   @@all = []
   
   def initialize(name)
     @name = name 
     @songs = []
   end 
   
   def self.all
     @@all
   end 
   
   def self.destroy_all 
     self.all.clear
   end 
   
   def save 
     @@all << self
   end 
   
   def self.create(name)
     Artist.new(name).tap {|a| a.save}
   end 
   
   def add_song(song)
     song.artist = self unless song.artist == self
     self.songs << song unless songs.include?(song)
   end 
   
   def genres 
     songs.collect{|song| song.genre}.uniq
   end 
   
end 