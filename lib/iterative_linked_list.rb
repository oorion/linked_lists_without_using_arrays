class IterativeLinkedList

	attr_reader :head, :count

	def initialize
		@head = nil
	end

	def push(item)
		current = @head
		if @head.nil?
			@head = Node.new(item, nil)
		else
			while current.next_node != nil
				current = current.next_node
			end
			current.next_node = Node.new(item, nil)
		end
	end

	def count
		current = @head
		if current.nil?
			return 0
		elsif current.next_node.nil?
			return 1
		else			
			counter = 1
			while current.next_node != nil
				counter = counter + 1
				current = current.next_node
				if current.next_node == nil
					return counter
				end
			end
		end
	end

	def pop
		current = @head
		if current.nil?
			return nil
		elsif current.next_node.nil?
			to_return = current.data
			@head = nil
			return to_return
		end

		while current.next_node.next_node != nil
			current = current.next_node
		end
		to_return = current.next_node.data
		current.next_node = nil
		return to_return

	end

	def delete(data)
		current = @head
		if current.data == data && current.next_node.nil?
			@head = nil
		elsif current.data == data && current.next_node != nil
			@head = head.next_node
		else

			while current.next_node != nil
				last = current
				current = current.next_node
				
				if current.data == data && current.next_node == nil
					last.next_node = nil
					return 0
				end

				if current.data == data
					last.next_node = current.next_node
				end
			end
		end
	end

	def to_a		
		return [] if head.nil?

		data = []
		current = @head
		while current.next_node != nil
			data << current.data
			current = current.next_node
		end
		
		data << current.data
		data

	end

	def last_node
		current = @head

		while current.next_node != nil
			current = current.next_node
		end
		current
	end

	def head_node
		@head
	end

	def include?(data)
		current = @head

		while current.next_node != nil
			return true if current.data == data
			current = current.next_node
		end
		false

	end

	def find(data)
		current = @head

		while current.next_node != nil
			return current if current.data == data
			current = current.next_node
		end

	end

	def insert(position, data)
		current = @head
		location = 1
		while current.next_node.next_node != nil
			if location == position
				current.next_node = Node.new(data, current.next_node)
				return 0
			else
				current = current.next_node
				location += 1
			end
		end
	end


	def index(data)
		current = @head
		location = 0
		while current.next_node != nil
			return location if current.data == data
			current = current.next_node
			location += 1
		end
	end

	def insert_after(after, data)
		current = @head

		while current.next_node.next_node != nil
			if current.data == after
				current.next_node = Node.new(data, current.next_node)
				return 0
			end
			current = current.next_node
		end
	
	end

	def distance(first, last)
		current = @head
		location = 0

		while current.next_node != nil
			start_loc = location if current.data == first
				
			end_loc = location if current.data == last
				
			current = current.next_node
			location += 1
		end
		end_loc = location if current.data == last
		return end_loc - start_loc
	end


			




end

class Node
	attr_accessor :data, 
								:next_node

	def initialize(data, next_node)
		@data 		= data
		@next_node 	= next_node
		# puts "Creating node with data: " + data.to_s
	end

end
