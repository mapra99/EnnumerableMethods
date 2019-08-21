# Methods Practice
include Enumerable
arr = [1,5,84,2,4,1,6,5,8]

#Using my_each
arr.my_each do |x|
  puts x if x%2 == 0
end
#OK

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
