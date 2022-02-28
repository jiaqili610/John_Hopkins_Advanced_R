# Jiaqi Li



################################################################################
# use recursive method to compute the sum of vector
################################################################################

vector_sum_rec <- function(v){
  if(length(v)==1){
    v
  } else {
    v[1]+vector_sum_rec(v[-1])
  }
}

vector_sum_rec(c(5,40,91))



################################################################################
# use recursion to compute Fibonacci sequence.
################################################################################


# 0, 1, 1, 2, 3, 5, 8 ...
# where each proceeding integer is the sum of the previous two integers


# Let’s write a function to compute the nth digit of the Fibonacci sequence 
# such that the first number in the sequence is 0, the second number is 1, 
# and then all proceeding numbers are the sum of the n - 1 and the n - 2 Fibonacci number. 

# It is immediately evident that there are three base cases:

# 1. n must be greater than 0
# 2. when n is equal to 1, return 0,
# 3. when n is equal to 2, return 1.

# and then the recursive case.

fib() <- function(n){
  
}