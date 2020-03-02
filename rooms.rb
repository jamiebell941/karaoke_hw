require("pry")

class Room

# include Enumerable
attr_reader :room_number, :room_size, :room_price, :booked_duration, :current_song, :available_songs, :till
attr_accessor :queued_songs, :occupance

  def initialize(room_number, room_size, room_price,
      booked_duration, available_songs, current_song = "No Song Playing " || [], queued_songs = [], till)
    @room_number = room_number
    @room_size = room_size
    @room_price = room_price
    @booked_duration = booked_duration
    @available_songs = available_songs
    @current_song = []
    @queued_songs = []
    @occupance = []
    @till = till
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
    if party.count <= @room_size
        @occupance.concat(party)
      elsif party.count >= @room_size
        puts "Your party will need a larger room"
      else party.count > 8
        puts "Sorry we don't have a room big enough"
      end
  end

  def check_in(guest)
    unless @occupance.count == @room_size
      if guest.wallet >= @room_price
          guest.reduce_wallet(@room_price)
          @till += (@room_price)
          @occupance << guest
      elsif guest.wallet < @room_price
        return  puts "Sorry, that room is too much"
      end
        return
    end
  end

    def check_out(guest)
      if @occupance.count > 0
          @occupance.delete(guest)
      elsif @occupance.count == 0
          puts "This room is empty now"
      end
    end

    def increase_till(amount)
      @till += amount
    end

    # def party_wallet(party)
    #   total = 0
    #   @JParty.reduce(0) {|total, guest| guest.wallet + total}
    #   return total
    # end

    # def party_check_in(party)
    #
end







  # def duration_timer(booking, queue)
  #   if booking >= @songs.reduce(0) {|total, song| song.duration}
  # end
