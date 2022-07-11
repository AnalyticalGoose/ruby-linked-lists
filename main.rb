
class LinkedList
    def initialize(value) 
        @head = Node.new(value, nil)
        @tail = Node.new(value, nil)
    end

    def prepend(value)
        if @head.nil?
            @head = value
            @tail = value
        else
            current_head = Node.new(value)
            current_head.next = @head
            @head = current_head
        end
    end

    def append(value)
        if @head.nil?
            @head = value
            @tail = value
        else
            current_node = @head
            new_node = Node.new(value)
            until current_node.next.nil?
                current_node = current_node.next
            end
            current_node.next = new_node
        end
    end

    def size
        if @head.nil?
            return "This list is empty"
        else
            x = 1
            current_node = @head
            until current_node.next.nil?
                current_node = current_node.next
                x += 1
            end
        return x
        end
    end

    def head
        return @head
    end

    def tail
        return @tail
    end

    def at(index)
        if index <= 0
            return @head
        else
            x = 1
            current_node = @head
            until x == index
                current_node = current_node.next
                x += 1
            end
        end
        return current_node.next
    end

    def pop
        if @head.nil?
            return "This list is empty"
        else
            current_node = @head
            until current_node.next.next.nil?
                current_node = current_node.next
            end
            last_node = current_node.next
            current_node.next = nil
        end
        return last_node
    end

    def contains?(value)
        if @head.value.nil?
            return false
        elsif @head.value == value
            return true
        elsif
            current_node = @head
            until current_node.next.nil?
                current_node = current_node.next
                if current_node.value == value
                    return true
                end
            end
        end
        return false
    end

    def find(value)
        if @head.nil?
            return "This list is empty"
        elsif @head.value == value
            return 0
        else
            x = 0
            current_node = @head
            until current_node.next.nil?
                current_node = current_node.next
                x += 1
                if current_node.value == value
                    return x
                end
            end
        end
        return nil
    end

    def to_s(string = "")
        string = "nil" if @head.nil?
        current_node = @head
        until current_node.nil?
            string.concat("( #{current_node.value} ) -> ")
            current_node = current_node.next
        end
        return string.concat("nil")
    end

end

    def insert_at(value, index)
        if index == 0
            prepend(value)
        else
            new_node = Node.new(value)
            prev_node = at(index - 1)
            prev_node.next_node = new_node
            @tail = new_node if new_node.next_node.nil?
        end
    end

    def remove_at(index)
        if index.zero?
            @head = at(1)
        elsif at(index) == @tail
            @tail = at(index - 1)
            @tail.next_node = nil
        else
            prev_node = at(index - 1)
            prev_node.next_node = at(index + 1)
        end
    end

class Node
    attr_accessor :value, :next

    def initialize(value, next_node = nil)
        @value = value
        @next = next_node
    end
end

list = LinkedList.new("testing")
list.append("testing123")
list.append("blabla")
list.prepend("first")

p list.to_s
p list.size
