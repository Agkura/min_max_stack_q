require_relative 'mystack'

class MinMaxStackQueue
  def initialize
    @store = MyStack.new
    @stack = MyStack.new
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    until @store.size == 1
      @stack.push(@store.pop)
    end
    output = @store.pop
    until @stack.empty?
      @store.push(@stack.pop)
    end
    output
  end

  def peek
    until @store.size == 1
      @stack.push(@store.pop)
    end
    output = @store.peek
    until @stack.empty?
      @store.push(@stack.pop)
    end
    output
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def min
    @store.min
  end

  def max
    @store.max
  end
end
