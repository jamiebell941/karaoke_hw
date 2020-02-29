class Room

include Enumerable

require("pry")
attr_reader :room_number, :room_size, :room_price, :booked_duration, :current_song, :available_songs
attr_accessor :queued_songs

  def initialize(room_number, room_size, room_price,
      booked_duration, available_songs, current_song = "No Song Playing " || [], queued_songs = [])
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
    @current_song << @queued_songs.first.track
    # binding.pry
  end

end
