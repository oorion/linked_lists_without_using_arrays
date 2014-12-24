require 'pry'
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

end

class Node
	attr_accessor :data, 
								:next_node

	def initialize(data, next_node)
		@data 		= data
		@next_node 	= next_node
		puts "Creating node with data: " + data.to_s
	end

end


# list = IterativeLinkedList.new
# list.push("hello")
# list.push("world")
# list.push("today")
# puts list.pop
# puts list.count
# puts list.pop
# puts list.count

