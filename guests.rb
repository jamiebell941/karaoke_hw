class Guest

attr_reader :name, :age, :fav_song
attr_accessor :wallet, :drunkeness

  def initialize(name, age, fav_song, wallet, drunkeness)
    @name = name
    @age = age
    @fav_song = fav_song
    @wallet = wallet
    @drunkeness = drunkeness
  end

end
