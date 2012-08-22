# encoding: utf-8
# Author: Edwin Rozario <rozarioed@gmail.com>
require 'set'

class Array

    def word_letter_pairs str
      @similarity_pairs[str] ||=
        str.upcase.split(/\s+/).map{ |word|
        (0 ... (word.length - 1)).map { |i| word[i, 2] }
      }.flatten.freeze
    end

    #Using string similarity described by Simon White.
    #Same functions in gem text from class WhiteSimilarity.
    def similarity str1, str2
      pairs1 = word_letter_pairs(str1)
      pairs2 = word_letter_pairs(str2).dup

      union = pairs1.length + pairs2.length

      intersection = 0
      pairs1.each do |pair1|
        if index = pairs2.index(pair1)
          intersection += 1
          pairs2.delete_at(index)
        end
      end

      (2.0 * intersection) / union
    end

  def similars subject
    @similarity_pairs = {}
    result = []
    self.each do |element|
      result << element if similarity(subject.to_s, element.to_s) > 0.0
    end
    result
  end

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
