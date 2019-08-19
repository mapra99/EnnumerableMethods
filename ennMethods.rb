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
      if yield(self[i])
        result[i] = self[i]
        i += 1
      end
    end
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
