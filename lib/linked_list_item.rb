class LinkedListItem
  include Comparable

  attr_reader :next_item
  attr_accessor :payload

  def initialize(value)
    @payload = value
  end

  def next_item=(other_item)
    raise ArgumentError if other_item === self
    @next_item = other_item
  end

  def last?
    @next_item.nil?
  end

  def <=>(other_item)
    if self.payload.class == other_item.payload.class
      self.payload <=> other_item.payload
    else
      precedence = [ Fixnum, String, Symbol ]
      left = precedence.index(self.payload.class)
      right = precedence.index(other_item.payload.class)
      left <=> right
    end
  end

  def ===(other_item)
    self.equal? other_item
  end
end

# =======

# class LinkedListItem
#
#   include Comparable
#
#   attr_reader :next_item
#   attr_reader :payload
#
#   def initialize(value)
#     @payload = value
#   end
#
#   def next_item=(other_item)
#     raise ArgumentError if other_item === self
#     @next_item = other_item
#   end
#
#   def last?
#     @next_item.nil?
#   end
#
#   def <=>(other_item)
#     if self.payload.class == other_item.payload.class
#       self.payload <=> other_item.payload
#     else
#       precedence = [ Fixnum, String, Symbol ]
#       left = precedence.index(self.payload.class)
#       right = precedence.index(other_item.payload.class)
#       left <=> right
#     end
#   end
#
#   def ===(other_item)
#     self.equal? other_item
#   end
# end

# =======

#   include Comparable
#
#   attr_reader :next_item
#   attr_reader :payload
#
#   def initialize(value)
#     @payload = value
#   end
#
#   # def next_item
#   #   @next_item
#   # end
#
#   def next_item=(other_item)
#     raise ArgumentError if other_item === self
#     @next_item = other_item
#
#     # if self == other_item
#     #   raise ArgumentError
#     # end
#   end
#
#   def last?
#     @next_item.nil?
#     # unless @next_item
#     #   true
#     # else
#     #   false
#     # end
#   end
#
#   # def ===(other_item)
#   #   self.eql?(other_item)
#   # end
#
#   def <=>(other_item)
#     if self.payload.class == other_item.payload.class
#       self.payload <=> other_item.payload
#     # elsif self.payload.is_a? Symbol
#     #   1
#     else
#       precedence = [ Fixnum, String, Symbol ]
#       left = precedence.index(self.payload.class)
#       right = precedence.index(other_item.payload.class)
#       left <=> right
#     end
#     # other_item.payload <=> self.payload
#     # @payload.to_s <=> other_item.payload.to_s
#   end
#
#   def ===(other_item)
#     self.eql? other_item
#     # self.object_id == other.item.object_id
#   end
#
#
#
#   # def >(item)
#   #   @payload > item.payload
#   # end
#   #
#   # def ===(item)
#   #   @payload === item.payload
#   # end
#   #
#   # def ==(item)
#   #   @payload == item.payload
#   # end
#
# end
