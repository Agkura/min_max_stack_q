class MyStack
  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    a = @store.pop
    if @store.empty?
      @max = []
      @min = []
    else
      @max.pop if @max.last == a
      @min.pop if @min.last == a
    end
    a
  end

  def push(el)
    if @store.empty?
      @max << el
      @min << el
    else
      @max << el if el >= @max.last
      @min << el if el <= @min.last
    end

    @store << el
  end

  def peek
    @store.last.dup
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def min
    @min.last
  end

  def max
    @max.last
  end
end
