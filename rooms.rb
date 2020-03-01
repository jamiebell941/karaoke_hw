class Room

include Enumerable

require("pry")
attr_reader :room_number, :room_size, :room_price, :booked_duration, :current_song, :available_songs
attr_accessor :queued_songs, :occupance

  def initialize(room_number, room_size, room_price,
      booked_duration, available_songs, current_song = "No Song Playing " || [], queued_songs = [])
    @room_number = room_number
    @room_size = room_size
    @room_price = room_price
    @booked_duration = booked_duration
    @available_songs = available_songs
    @current_song = []
    @queued_songs = []
    @occupance = []
  end

  def add_song_to_queue(song)
   @queued_songs.push(song)
 end

  def move_queue_to_current
    @current_song << @queued_songs.first.track
    puts "Now Playing #{current_song}!!"
    # binding.pry
  end

  def fill_room(party)
    @occupance.concat(party)
    # binding.pry
  end

  def check_in(guest)
    unless @occupance.count == @room_size
      if guest.wallet >= @room_price
        guest.reduce_wallet(@room_price)
        @occupance << guest
      elsif guest.wallet < @room_price
        return  puts "Sorry, that room is too much"
      end
        return
      end
       puts "The room is full, sorry"
    end





  end








  # def duration_timer(booking, queue)
  #   if booking >= @songs.reduce(0) {|total, song| song.duration}
  # end
