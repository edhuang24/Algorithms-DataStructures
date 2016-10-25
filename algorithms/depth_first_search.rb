def dfs(target_value)
  if self.value == target_value
    return self
  end
  children.each do |child|
    result = child.dfs(target_value)
    return result if result
  end
  nil
end
