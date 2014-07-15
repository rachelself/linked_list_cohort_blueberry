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

  #bracket method means call get
  alias [] get

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
    current_item = @first_item
    return true if current_item.nil?
    until current_item.last?
      return false if current_item > current_item.next_item
      current_item = current_item.next_item
    end
    true
  end

  def swap_with_next(index)
    if index == 0
      item = get(index, true)
      following_item = get(index + 1, true)
      last_item = get(index + 2, true)

      @first_item = following_item
      @first_item.next_item = item
      item.next_item = last_item
    else
      previous_item = get(index-1, true)
      item = get(index, true)
      following_item = get(index + 1, true)
      last_item = get(index + 2, true)

      previous_item.next_item = following_item
      following_item.next_item = item
      item.next_item = last_item
    end
  end

  def sort!
    return if @size <= 1

    until sorted?
      0.upto(@size-2) do |i|
        item = get(i, true)
        item2 = get(i+1, true)

        if(item <=> item2) == 1 #first item is greater
          swap_with_next(i)
        end
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
