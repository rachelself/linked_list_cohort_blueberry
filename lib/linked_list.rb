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

  def get(index, return_item=false)
    raise IndexError if index < 0

    current_item = @first_item
    index.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_item
    end
    return_item ? current_item : current_item.payload
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
    raise IndexError if index > @size
    if index == 0
      @first_item = @first_item.next_item
    else
      previous_item = get(index - 1, true)
      next_item = get(index + 1, true)
      previous_item.next_item = next_item
    end
    @size -= 1
  end

  def index(payload)
    index = -1
    current_item = @first_item
    until current_item.nil?
      index += 1
      return index if current_item.payload == payload
      current_item = current_item.next_item
    end
    nil
  end

  def sorted?
    # call sort and then compare the sorted list to original list
    # if they match then return true.

    # current_item = @first_item
    # until current_item.nil?
    #   index += 1
    #   return true if current_item > current_item.next_item
    #   # previous_item = get(index - 1, true)
    #   # next_item = get(index + 1, true)
    #   # previous_item.next_item = next_item
    #
    #   return true if
    # end
    # true
  end

  def sort
    # code to sort it, called from sorted?
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
