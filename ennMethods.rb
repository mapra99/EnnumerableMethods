# Module
module Enumerable
  #my_each: clone of each
  def my_each
    for x in self do
      yield(x)
    end
    return self
  end

  #my_each_with_index: clone of each.with_index
  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end
    return self
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
  def my_all?(pattern = nil)
    test = true
    if(block_given?)
      self.my_each do |x|
        test = test && yield(x)
      end 
    else
      if(pattern.nil?)
        self.my_each do |x|
          test = test && (x==true)
        end
      else
        self.my_each do |x|
          test = test && (x.match?(pattern))
        end
      end
    end
    return test
  end

  #my_any?: clone of any?
  def my_any?(pattern = nil)
    test = false
    if(block_given?)
      self.my_each do |x|
        test = test || yield(x)
      end
    else
      if(pattern.nil?)
        self.my_each do |x|
          test = test || (x == true)
        end
      else
        self.my_each do |x|
          test = test || (x.match?(pattern))
        end
      end
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
  def my_count(pattern = nil)
    if(block_given?)
      counter = 0
      self.my_each do |x|
        counter += 1 if yield(x)
      end
      return counter
    else
      if(pattern.nil?)
        return self.length 
      else
        counter = 0
        self.my_each do |x|
          counter += 1 if x.match?(pattern)
        end
        return counter
      end
    end
    
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
      self[i] = proc.call self[i] if !proc.nil?
      self[i] = yield(self[i]) if proc.nil?
    end
    return self
  end

  #my_inject: clone of inject
  def my_inject(val = nil)
    result = self.first
    (1...self.entries.length).my_each do |i|
      result = yield(result, self.entries[i])
    end
    result = yield(result, val) if !val.nil?
    return result
  end
end

def multiply_els(arr)
  include Enumerable
  arr.my_inject do |elem, n|
    elem*n
  end
end