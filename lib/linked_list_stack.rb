require "./linked_list"

class Stack
	attr_accessor :size

	def initialize
		@list = LinkedList.new
		self.size = 0
	end

	def push(a)
		@list.add(0, a)
		self.size = @list.size
	end

  def pop
    return false if @list.size == 0
		@list.remove(0)
		self.size = @list.size
	end

  def top
  	@list.get(0)
  end

  def stacked_previous
  	@list.get(1)
  end
end
