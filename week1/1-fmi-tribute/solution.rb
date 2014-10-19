class Array
  def to_hash
    hash = {}
    flatten.each_slice(2) do |previous, following|
      hash[previous] = following
    end
    hash
  end

  def index_by
    hash = {}
    map { |element| hash[yield(element)] = element }
    hash
  end

  def subarray_count(subarray)
    count = 0
    each_cons(subarray.length) do |elements|
      count += 1 unless subarray != elements
    end
    count
  end

  def occurrences_count
    hash = {}
    each do |element|
      hash[element] = count(element)
    end
    hash
  end
end
