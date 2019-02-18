require "./linked_list"

class Queue
  attr_accessor :size

  def initialize
  	@list = LinkedList.new
    self.size = 0
  end

  def enqueue(data)
	  @list.add(data)
    self.size = list.size
  end

  def dequeue
	  @list.remove(0)
    self.size = list.size
  end
end
