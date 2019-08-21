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

  #my_count: clone of count
  def my_count
    counter = 0
    self.my_each do |x|
      counter += 1 if yield(x)
    end
    return counter
  end

  #my_map: clone of map
  def my_map_v1    
    (0...self.length).each do |i|
      self[i] = yield(self[i])
    end
    return self
  end

  #my_map_v2: clone of map. Accepts both procedures and blocks
  def my_map_v2(proc = nil)   
    (0...self.length).each do |i|
      proc == nil? yield(self[i]) : proc.call self[i]
    end
    return self
  end

  

  #my_inject: clone of inject
  def my_inject
    result = self[0]
    (1...self.length).my_each do |i|
      result = yield(result, self[i])
    end

    return result
  end
end

def multiply_els(arr)
  include Enumerable
  arr.my_inject do |elem, n|
    elem*n
  end
end

multiply_els([2,3,2])