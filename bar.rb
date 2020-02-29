class Bar

  attr_reader :drinks
  attr_accessor :tab, :till

  def initialize(till, tab, drinks)
    @till = till
    @tab = tab
    @drinks = drinks
  end

  def increase_till(amount)
    @till += amount
  end

  def guest_buys_room(guest, room)
    increase_till(room.room_price)
    guest.reduce_wallet(room.room_price)
  end

end
