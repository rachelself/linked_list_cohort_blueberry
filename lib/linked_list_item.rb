class LinkedListItem
  include Comparable

  attr_reader :next_item
  attr_reader :payload

  def initialize(value)
    @payload = value
  end

  # def next_item
  #   @next_item
  # end

  def next_item=(other_item)
    @next_item = other_item
    if self == other_item
      raise ArgumentError
    end
  end

  def last?
    unless @next_item
      true
    else
      false
    end
  end

  def ===(other_item)
    self.eql?(other_item)
  end

  def <=>(other_item)
    @payload.to_s <=> other_item.payload.to_s
  end

  # def >(item)
  #   @payload > item.payload
  # end
  #
  # def ===(item)
  #   @payload === item.payload
  # end
  #
  # def ==(item)
  #   @payload == item.payload
  # end

end
