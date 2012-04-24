class Array

  def anypop list, numbers = nil
    if numbers.nil?
      popped = list.pop
      return popped, list
    else
      popped = []
      numbers.times do |i|
        popped << list.pop
      end
      return popped, list
    end
  end

  def lpush element
    self.insert(0, element)
  end

  def rpush element
    self.insert(-1, element)
  end

  def ppush element, priority
    if priority - 1 > self.length
      self.insert(-1, element)
    elsif priority - 1 < 0
      self.insert(0, element)
    else
      self.insert(priority - 1, element)
    end
  end

  def lpop numbers = nil
    return nil if self.length == 0
    reversed_self = self.reverse
    popped, list = anypop(reversed_self, numbers)
    self.replace(list.reverse)
    return popped
  end

  def rpop numbers = nil
    return nil if self.length == 0
    popped, list = anypop(self, numbers)
    self.replace(list)
    return popped
  end

  def substitute element, substitute_element
    self.count(element).times do |i|
      index = self.index(element)
      self.delete_at(index)
      self.insert(index, substitute_element)
    end
    self
  end

end
