class Node
	attr_accessor :data, :next
	def initialize(data)
		self.data = data
	end
end

class LinkedList
	attr_accessor :head, :tail, :size

	def initialize
		self.size = 0
	end

	def add(index = nil, number)
		node = Node.new(number)

		case index
		when nil
			if @head.nil?
				self.head = node
				self.tail = node
			else
				self.tail.next = node
				self.tail = node
			end
		when 0
			node.next = self.head
			self.head = node
		when 1...@size
			prev_node = get_node(index - 1)
			curr_node = get_node(index)
			prev_node.next = node
			node.next = curr_node
		else
			return false
		end

		self.size += 1
		node
	end

	def get(index)
	  get_node(index).data if @head
	end

	def remove(index)
		return false unless index.between?(0, @size - 1)

		removed = get_node(index).data

		if index == 0
			@head = get_node(1)
		elsif index == @size - 1
			get_node(index - 1).next = nil
			@tail = get_node(index - 1)
		else
			get_node(index - 1).next = get_node(index + 1)
		end

		self.size -= 1
		removed
	end

	private
	def get_node(index)
		node = @head
		index.times { node = node.next }
		node
	end
end
