# An implementation of the heap data structure in ruby.
require 'byebug'
class Heap

  def initialize
    @store = [nil]
  end
  
  attr_reader :store

  def parent(i)
    parent_idx = i / 2
    return nil unless @store[parent_idx]
    { value: @store[parent_idx], index: parent_idx}
  end

  def l_child(i)
    lc_idx = 2 * i
    return nil unless @store[lc_idx]
    { value: @store[lc_idx], index: lc_idx}
  end

  def r_child(i)
    rc_idx = 2 * i + 1
    return nil unless @store[rc_idx]
    { value: @store[rc_idx], index: rc_idx}
  end

  def heapify_down(i)
    return true unless @store[i] && l_child(i)
    
    if r_child(i)
      larger_child = l_child(i)[:value] > r_child(i)[:value] ? l_child(i) : r_child(i)
      
       if larger_child[:value] > @store[i]
          @store[i], @store[larger_child[:index]] = @store[larger_child[:index]], @store[i]
          heapify_down(larger_child[:index])
       end
       
    else
      lc = l_child(i)
      
      if lc[:value] > @store[i]
        @store[i], @store[lc[:index]] = @store[lc[:index]], @store[i]
        heapify_down(lc[:index])
      end
    end
    
    true
  end
  
  def insert(value)
    if value.is_a?(Array)
      value.each { |el| insert(el) }
      return
    end
    
    @store << value
    
    heapify_up(@store.size - 1)
    true
  end
  
  def heapify_up(i)
    parent = parent(i)
    return true unless parent
    
    if parent[:value] < @store[i]
      @store[i], @store[parent[:index]] = @store[parent[:index]], @store[i]
      heapify_up(parent[:index])
    end
    true
  end
  
  def delete(i)
    return false unless @store[i]
    
    if i == @store.size - 1
      @store.pop
      return true
    else
      @store[i], @store[@store.size - 1] = @store[@store.size - 1], @store[i]
      @store.pop
      heapify_down(i)
    end
  end
end