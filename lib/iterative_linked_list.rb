class IterativeLinkedList
	attr_reader :store

	def initialize
		@store = Node.new(nil)
	end

	def count
		unless store.pointer.nil?
			count = 1
			last_node = store.pointer
			while last_node.pointer do
				count += 1
				last_node = last_node.pointer
			end
			count
		else
			0
		end
	end

	def push(item)
		last_node.pointer = Node.new(item)
	end

	def last_node
		unless store.pointer.nil?
			node = store.pointer
			while node.pointer do
				node = node.pointer
			end
			node
		else
			store
		end
	end

	def pop
		unless store.pointer.nil?
			node = store
			while node.pointer.pointer do
				node = node.pointer
			end
			output = node.pointer
			node.pointer = nil
			output.data
		end
	end

	def delete(item)
		node = store
		until node == last_node || node.pointer.data == item do
			node = node.pointer
		end
		found_node = node.pointer
		node_prior_to_found_node = node
		if found_node != nil
			node_prior_to_found_node.pointer = found_node.pointer
		end
	end

	def to_a
		output = []
		if store.pointer.nil?
			output
		else
			node = store
			while node.pointer != nil
				output << node.pointer.data
				node = node.pointer
			end
			output
		end
	end
end

class Node
	attr_reader :data
	attr_accessor :pointer

	def initialize(data)
		@data = data
		@pointer = nil
	end
end
