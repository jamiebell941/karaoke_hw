class Song

attr_reader :track, :artist, :duration, :times_played

  def initialize(track, artist, duration, times_played)
    @track = track
    @artist = artist
    @duration = duration
    @times_played = times_played
  end

  def find_song_by_name(name)
    return @songs.find {|song| song.track == name}
  end

  



end
