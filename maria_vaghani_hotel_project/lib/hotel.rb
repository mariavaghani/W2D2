require_relative "room"

class Hotel

  attr_reader :rooms

  def initialize(name, room_name_hash)
    @name = name
    @rooms = {}
    room_name_hash.each do |key, value|
      @rooms[key] = Room.new(value)
    end    
  end

  def name
    new_name = @name.split(" ")
    new_name.map! { |word| word.capitalize}
    new_name.join(" ")
  end

  def room_exists?(entered_room)
    @rooms.keys.include?(entered_room)
  end

  def check_in(person, entered_room)
    if room_exists?(entered_room)
      if @rooms[entered_room].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, the room is full"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    !@rooms.values.all? { |room| room.full? }
  end

  def list_rooms
    @rooms.each do |room_name, room|
      puts room_name + '. ' + (room.available_space).to_s
    end
  end
end
