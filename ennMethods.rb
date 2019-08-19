# Module
module Enumerable
  #my_each: clone of each
  def my_each
    for(i in 1...self.length)
      yield(self[i])
    end
  end
end

# Methods Practice
include Enumerable
my_each(arr) do |x|
  puts x
end
