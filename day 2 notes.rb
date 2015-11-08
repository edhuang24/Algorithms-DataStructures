anything where you would write a dynamic program for can be done recursively

if there is any part of a problem where you know you can memoize something, then you can do dynamic programming. 
it will be dependent on the structure of the problem and the provided information for the problem.

# problem: you have a matrix of 1s and 0s. you start at the top left and can only move down or to the right. 
# calculate how many valid paths there are to the bottom right cell.

def find_path(matrix)

	path_matrix = Array.new(matrix.length + 1) { Array.new(matrix[0].length + 1) {0} }

	path_matrix[0][1] = 1

	# we're not starting at 0,0 but 1,1

	matrix.each_with_index do |row, i|
		row.each_with_index do |el, j|
<<<<<<< HEAD
			# we have to use i + 1 and j + 1 because path_matrix is always one row and one column larger than the input matrix
=======
>>>>>>> origin/master
			path_matrix[i + 1][j + 1] = el == 0 ? 0 : path_matrix[i][j + 1] + path_matrix[i + 1][j]
		end
	end

	path_matrix.last.last

end
<<<<<<< HEAD


=======
>>>>>>> origin/master
