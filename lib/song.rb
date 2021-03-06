class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    object = self.find_by_name(name)
    if object 
      object
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    object = self.all.sort_by {|song| song.name}
    object
  end

  def self.new_from_filename(file)
    arr = file.split(" - ")
    arr[1] = arr[1].chomp(".mp3")
    song = self.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(file)
    object = self.new_from_filename(file)
    song = self.create
    song.name = object.name
    song.artist_name = object.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
