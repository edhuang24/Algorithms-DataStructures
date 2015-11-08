def lcs_table(str1, str2)
  # Create your DP matrix in here.
  grid = Array.new(str1.length + 1) { Array.new(str2.length + 1) }

  (0..str1.length).each do |el|
    grid[el][0] = 0
  end

  (0..str2.length).each do |el|
    grid[0][el] = 0
  end

  # return grid

  i = 1

  while i < str1.length + 1
    j = 1
    while j < str2.length + 1
      if str1[i - 1] == str2[j - 1]
        grid[i][j] = grid[i - 1][j - 1] + 1
      else
        grid[i][j] = [ grid[i][j - 1], grid[i - 1][j] ].max
      end
      j += 1
    end
    i += 1
  end

  grid
end

def lcs_length(str1, str2)
  lcs_table(str1, str2).last.last
  # <== This will select the bottom right cell of your DP matrix, which should be the longest subsequence length
end

def lcs(str1, str2)
  # actually generate the LCS! Work backwards from your DP matrix.
  grid = lcs_table(str1, str2)
  i = grid.length - 1
  j = grid[0].length - 1

  result = ""

  while i >= 0 && j >= 0
    if grid[i - 1][j] == grid[i][j]
      i -= 1
    elsif grid[i][j - 1] == grid[i][j]
      j -= 1
    else
      result += str1[i - 1]
      i -= 1
      j -= 1
    end
  end

  result.reverse
end

EDIT_COSTS = {
  replace: 1,
  insert: 1,
  delete: 1,
}

def levenshtein_grid(str1, str2)
  grid = Array.new(str1.length + 1) { Array.new(str2.length + 1) }

  (0..str1.length).each do |el|
    grid[el][0] = el
  end

  (0..str2.length).each do |el|
    grid[0][el] = el
  end

  i = 1

  while i < str1.length + 1
    j = 1
    while j < str2.length + 1
      if str1[i - 1] == str2[j - 1]
        grid[i][j] = grid[i - 1][j - 1]
      else
        grid[i][j] = [ grid[i][j - 1], grid[i - 1][j], grid[i - 1][j - 1] ].min + 1
      end
      j += 1
    end
    i += 1
  end

  grid
end

def edit_distance(str1, str2)
  costs = EDIT_COSTS
  # Figure out the Levenshtein distance between these two strings!
  levenshtein_grid(str1, str2).last.last
end

def autocorrect(str)
  dict = []
  File.foreach("dictionary.txt") { |line| dict << line.chomp if line[0] == str[0] }
  # Do stuff in here to create your autocorrect method! I've given you a dictionary.
  dict.min_by { |word| edit_distance(str, word) }
end
