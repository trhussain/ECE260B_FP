import numpy as np 
np.set_printoptions(
    precision=3,        # Limit decimal places
    suppress=True,      # Avoid scientific notation
    linewidth=120,      # Max characters in a line
    floatmode='fixed'   # Force fixed-point formatting
)


##### --- LINUX CLOUD IS IN PYTHON 2.7 --- RUN THIS WITHIN PYTHON 3.XX ---- WILL NOT WORK WITHIN LINUX CLOUD





qArr = np.array([
    [-5, 7, -5, -7, -1, 6, 1, 2],
    [-4, 7, -2, -5, -3, 4, 1, -3],
    [-4, -1, -4, -4, 0, 5, 2, 0],
    [-3, 3, 6, -4, 6, 2, 1, 6],
    [-8, 5, -2, 6, 2, 1, -3, 4],
    [-2, -1, -2, -6, -1, 4, 0, 2],
    [5, -7, -1, 3, 2, 1, -7, 6],
    [5, -8, -3, 6, 0, -2, 6, -1]
])

kArr = np.array([
    [-6, 3, -2, -1, -5, 1, 0, 7],
    [0, -5, -8, 0, 6, 0, -5, -7],
    [4, -7, -6, 3, 7, 7, 6, 6],
    [-3, 0, 0, -7, 6, 3, 4, 7],
    [6, -3, 4, -7, -4, -3, -2, -5],
    [0, -7, 3, 3, -2, 6, 4, -1],
    [7, -5, 2, 1, 3, 6, 1, -5],
    [3, -1, 6, 3, -6, -2, 1, -4]
])


matRes = qArr @ kArr.T


# Matrix Multiplication result
# ----
# [[  93  -20   -7   94  -48  -45  -63  -86]
#  [  52  -21  -73   24   -5  -33  -41  -23]
#  [  38   27   50   63  -28   21   -3  -55]
#  [  33  -74   17  125  -37  -17  -27  -51]
#  [  80  -10  -10   13 -138  -37  -90  -56]
#  [  42    1   26   68    7    7   -8  -45]
#  [ -19   48   99   -7   -1   23   46  -20]
#  [ -63   41  128  -46   -1   78   74   37]]
# ----