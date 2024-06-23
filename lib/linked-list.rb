require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    tail.next_node = Node.new(value)
  end

  def prepend(value)
    return @head = Node.new(value) if @head.nil?

    @head = Node.new(value, @head)
  end

  def size(node = @head, count = 0)
    return count if @head.nil?

    count += 1 
    size(node.next_node, count)
  end

  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, node = @head, current_index = 1)
    return node if index == current_index

    at(index, node.next_node, current_index + 1)
  end

  def pop(node = @head)
    return nil if @head.nil? || @head.next_node.nil?
    return node.next_node = nil if node.next_node.next_node.nil?

    pop(node.next_node)
  end

  def contains?(value, node = @head)
    return true if node.value == value
    return false if node.next_node.nil?

    contains?(value,  node.next_node)
  end

  def find(value, node = @head, index = 1)
    return current_index if value == node.value
    return nil if node.next_node.nil?

    find(value, node.next_node, index + 1)
  end

  def to_s(string = '',node = @head)
    return nil if @head.nil?

    string += "( #{node.value} ) -> "
    return string += "nil" if node.next_node.nil?

    to_s(string, node.next_node)
  end

end
  