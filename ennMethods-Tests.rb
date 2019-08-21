# Methods Practice
include Enumerable
arr = [1,5,84,2,4,1,6,5,8]

#Using my_each
arr.my_each do |x|
  puts x if x%2 == 0
end
#OK

#Using my_each_with_index
a = 0
arr.my_each_with_index do |x, index|
  a = a + x*index
  puts a
end
#OK

#Using my_select
r = arr.select do |value|
  value.odd?
end
puts r
#OK

#Using my_all?
arr.my_all? do |x|
  x.odd?
end
#OK
arr.my_all? do |x|
  x > 0
end
#OK

#Using my_any?
arr.my_any? do |x|
  x.odd?
end
#OK
arr.my_any? do |x|
  x < 1
end
#OK

#Using my_none?
arr.my_none? do |x|
  x.odd?
end
#OK
arr.my_none? do |x|
  x < 1
end
#OK

#Using my_count
arr.my_count do |x|
  x.odd?
end
#OK
arr.my_count do |x|
  x < 1
end
#OK



