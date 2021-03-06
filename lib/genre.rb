class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs 
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
    Genre.new(name).tap {|g| g.save}
  end 
  
  def artists
    songs.collect{|song| song.artist}.uniq
  end 
end 
