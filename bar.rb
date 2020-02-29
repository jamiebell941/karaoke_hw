class Bar

  attr_reader :drinks
  attr_accessor :tab, :till

  def initialize(till, tab, drinks)
    @till = till
    @tab = tab
    @drinks = drinks
  end

end
