# Module
module Enumerable
  #my_each: clone of each
  def my_each
    for(i in 1...self.length)
      yield(self[i])
    end
  end

  #my_each_with_index: clone of each.with_index
  def my_each_with_index
    for(i in 1...self.length)
      yield(self[i], i)
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
