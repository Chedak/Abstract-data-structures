require "./linked_list"

class Queue
  def initialize
  	@list = LinkedList.new
  end

  def enqueue(data)
	  @list.add(data)
  end

  def dequeue
	  @list.remove(0)
  end
end
