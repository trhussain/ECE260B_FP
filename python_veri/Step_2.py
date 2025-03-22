import numpy as np

##### --- LINUX CLOUD IS IN PYTHON 2.7 --- RUN THIS WITHIN PYTHON 3.XX ---- WILL NOT WORK WITHIN LINUX CLOUD




# Function to read a text file and convert it into a NumPy matrix
def read_matrix_from_file(filename):
    with open(filename, 'r') as f:
        matrix = [list(map(int, line.split())) for line in f]
    return np.array(matrix)

# Read k_data.txt and q_data.txt
k_matrix = read_matrix_from_file("kdata.txt")
q_matrix = read_matrix_from_file("qdata.txt")

# Perform matrix multiplication
result_matrix = np.matmul(q_matrix, k_matrix.T)  # or use k_matrix @ q_matrix

# Compute row sums using absolute values
row_sums_abs = np.abs(result_matrix).sum(axis=1, keepdims=True)

# Append the absolute row sums as a new column
result_with_abs_sums = np.hstack((result_matrix, row_sums_abs))

print("### K MATRIX ###")
print(k_matrix)
print("### Q MATRIX ###")
print(q_matrix)

# Display the result
print("Result of K * Q Matrix Multiplication with Absolute Row Sums:")
print(result_with_abs_sums)

# Normalize each row by dividing by the sum of absolute values
normalized_result = np.divide(abs(result_matrix), row_sums_abs, where=row_sums_abs != 0)
bitshift = 20
print(f"Normalized result bit shifted by {bitshift}")
print((normalized_result * (2 ** bitshift)).astype(int))

## Terminal Output ## 

# Normalized result bit shifted by 20
# [[213854  45990  16096 216153 110376 103477 144869 197757]
#  [200463  80956 281419  92521  19275 127216 158057  88666]
#  [194042  29852 141800 253747  93289  11194 160458 164189]
#  [ 90821 203660  46786 344020 101830  46786  74308 140360]
#  [193285  24160  24160  31408 333418  89394 217446 135300]
#  [215883   5140 133642 349525  35980  35980  41120 231303]
#  [ 75752 191375 394711  27908   3986  91700 183401  79739]
#  [141154  91862 286790 103065   2240 174762 165800  82900]]