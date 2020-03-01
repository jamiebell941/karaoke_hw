require_relative("./rooms")

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

  # def guest_buys_room(guest, room)
  #   increase_till()
  #   guest.reduce_wallet()
  # end


end
