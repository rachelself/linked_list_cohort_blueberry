class LinkedList

  attr_accessor :size

  def initialize(*seed)
    @size = 0

    unless seed == nil
      seed.each do | value |
        push(value)
      end
    end
  end

  def push(value)
    @size += 1

    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
  end

  def get(index)
    if index < 0
      raise IndexError
    end

    current_item = @first_item
    index.times do
      if current_item
        current_item = current_item.next_item
      else
        raise IndexError
      end
    end
    current_item.payload
  end

  def last
    unless @size == 0
      last_item.payload
    end
  end

  def to_s
    if @size == 0
      "| |"
    else
      payloads = []
      count = 0

      while count < @size
        payloads << get(count)
        count += 1
      end

      "| #{payloads.join(', ')} |"
    end
  end

  def [](index)
    get(index)
  end

  def []=(index, str)
    current = replace(index, str)
    current
  end

  def replace(index, str)
    current_item = @first_item
    index.times do
      if current_item
        current_item = current_item.next_item
      else
        raise IndexError
      end
    end
    current_item.payload = str
    current_item.payload
  end

  def delete(index)
    current_item = @first_item
    index.times do
      if current_item
        current_item = current_item.next_item
        current_item
      else
        raise IndexError
      end
    end
  end

  private

  def last_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end

end
