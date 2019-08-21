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

#Using my_map_v1 (with only blocks)
newArr = arr.my_map_v1 do |x|
  x*1
end
puts newArr
#OK

#Using my_map_v2 (either block or procedure)
#WITH BLOCK
arr.my_map_v2 do |x|
  x*1
end
#OK

#WITH PROC
p = lambda do |x|
  x*1
end

arr.my_map_v2(p)
#OK

#Using my_inject
arr.my_inject do |x, y|
  x*y
end

#Using multiply_els
multiply_els(arr)