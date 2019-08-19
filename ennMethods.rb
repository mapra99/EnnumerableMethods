# Module
module Enumerable
  #my_each: clone of each
  def my_each
    for i in 0...self.length do
      yield(self[i])
    end
  end

  #my_each_with_index: clone of each.with_index
  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end
  end

  #my_select: clone of select
  def my_select
    i = 0
    result = []
    self.my_each do |x|
      if yield(x)
        result[i] = x
        i += 1
      end
    end
    return result
  end

  #my_all?: clone of all?
  def my_all?
    test = true
    self.my_each do |x|
      test = test && yield(x)
    end
    return test
  end

  #my_any?: clone of any?
  def my_any?
    test = false
    self.my_each do |x|
      test = test || yield(x)
    end
    return test
  end

  #my_none?: clone of none?
  def my_none?
    test = true
    self.my_each do |x|
      test = test || !yield(x)
    end
    return test
  end

  #my_count?: clone of count?
  def my_count?
    counter = 0
    self.my_each do |x|
      counter += 1 if yield(x)
    end
    return counter
  end
end

# Methods Practice
include Enumerable
arr = [1,5,84,2,4,1,6,5,8]

arr.my_each do |x|
  puts x
end

arr.my_each_with_index do |x, index|
  puts "value: #{x} with index: #{index}"
end

arr.my_select do |value|
  value.odd?
end

arr.my_all? do |x|
  x.odd?
end

arr.my_any? do |x|
  x.odd?
end
