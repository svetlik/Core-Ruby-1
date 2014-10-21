class Hash
  def pick(*keys)
    new_hash = dup
    new_hash.select { |key| keys.include? key }
  end

  def except(*keys)
    new_hash = dup
    new_hash.reject { |key| keys.include? key }
  end

  def compact_values
    new_hash = dup
    new_hash.select { |key| (new_hash[key] != false) && (new_hash[key] != nil) }
  end

  def defaults(hash)
    new_hash = dup
    hash.each { |key, value| new_hash[key] = value unless new_hash.include? key }
    new_hash
  end

  def pick!(*keys)
    select! { |key| keys.include? key }
  end

  def except!(*keys)
    reject! { |key| keys.include? key }
  end

  def compact_values!
    select! { |key| (self[key] != false) && (self[key] != nil) }
  end

  def defaults!(hash)
    hash.each { |key, value| self[key] = value unless self.include? key }
    self
  end
end
