class Hash
  def pick(*keys)
    dup.pick! keys
  end

  def except(*keys)
    dup.except! keys
  end

  def compact_values
    dup.compact_values!
  end

  def defaults(hash)
    dup.defaults!(hash)
  end

  def pick!(*keys)
    select! { |key| keys.flatten.include? key }
  end

  def except!(*keys)
    reject! { |key| keys.flatten.include? key }
  end

  def compact_values!
    select! { |key| self[key] }
  end

  def defaults!(hash)
    hash.each { |key, value| self[key] = value unless self.include? key }
    self
  end
end
