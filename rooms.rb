class Room

include Enumerable

require("pry")
attr_reader :room_number, :room_size, :room_price, :booked_duration, :current_song, :available_songs
attr_accessor :queued_songs

  def initialize(room_number, room_size, room_price,
      booked_duration, available_songs, current_song = [], queued_songs = [])
    @room_number = room_number
    @room_size = room_size
    @room_price = room_price
    @booked_duration = booked_duration
    @available_songs = available_songs
    @current_song = []
    @queued_songs = []
  end

  def add_song_to_queue(song)
   @queued_songs.push(song)
 end

  def move_queue_to_current
    next_song = []
    next_song << @queued_songs.delete_at(0)
    @current_song.push(next_song)
  end
  # def find_song_by_name(name)
  #   return @songs.find { |song| song.track == name }
  # end

  # def add_song_to_queue(name)
  #     sng_name = @songs.map { |song| song.track == name }
  #   @queued_songs.push(sng_name)
    # fnd_sng_nme = found_song.map { |song| song.track }
    # return  @queued_songs.push(fnd_sng_nme)
  # end

end
