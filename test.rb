# puts "Enter Your Name"
# name = gets.chomp
# p "Hello, " + name.capitalize

# puts "Enter Your age"
# age = gets.chomp
# p "You are going to be " + (age.to_i + 1).to_s + " years old next year"

# this class fails to encapsulate
class Queue
  def initialize
    @line = []
  end



  def [](position)
    @line[position]
  end

  def []=(position, ele)
    @line[position] = ele
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
		@line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new

grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.line.unshift("noam")   # noam cut the line!
grocery_checkout.remove                 # => "noam"