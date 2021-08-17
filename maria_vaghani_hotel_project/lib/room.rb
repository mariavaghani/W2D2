class Room

  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    if @occupants.length < @capacity
      return false
    else
      return true
    end
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(guest_name)
    if full?
      return false
    else
      @occupants << guest_name
      return true
    end
  end
end
