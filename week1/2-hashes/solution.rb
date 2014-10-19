class Hash
  def pick(*keys)
    select { |key| keys.include? key }
  end

  def except(*keys)
    reject { |key| keys.include? key }
  end

  def compact_values
    select { |key| (self[key] != false) && (self[key] != nil) }
  end

  def defaults(hash)
    hash.each { |key, value| self[key] = value unless self.include? key }
    self
  end

  def pick!(*keys)
    select! { |key, value| keys == Hash[key, value] }
    self
  end

  def except!(*keys)
    reject! { |key| keys.include? key }
  end

  def compact_values!
    select! { |key| (self[key] != false) && (self[key] != nil) }
  end

  def defaults!(hash)
    hash.each { |key, value| self.merge!(key, value) unless self.include? key }
  end
end
