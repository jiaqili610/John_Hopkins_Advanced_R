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

fib <- function(n){
  stopifnot(n > 0)
  if(n == 1){
    0
  } else if(n == 2){
    1
  } else {
    fib(n - 1) + fib(n - 2)
  }
}



# map
require(purrr)
map_dbl(1:12, fib)


# This duplication of computation slows down your program significantly 
# as you calculate larger numbers in the Fibonacci sequence. Thankfully you can 
# use a technique called memoization in order to speed this computation up. 
# Memoization stores the value of each calculated Fibonacci number in table 
# so that once a number is calculated you can look it up instead of needing 
# to recalculate it!


# Below is an example of a function that can calculate the first 25 Fibonacci 
# numbers. First we’ll create a very simple table which is just a vector 
# containing 0, 1, and then 23 NAs. First the fib_mem()function will check 
# if the number is in the table, and if it is then it is returned. Otherwise 
# the Fibonacci number is recursively calculated and stored in the table. 
# Notice that we’re using the complex assignment operator <<- in order to modify 
# the table outside the scope of the function. You’ll learn more about the 
# complex operator in the section titled Expressions & Environments.



fib_tbl <-  c(0, 1, rep(NA, 23))

fib_mem <- function(n) {
  stopifnot(n > 0)
  
  if(!is.na(fib_tbl[n])){
    fib_tbl[n]
  } else {
    fib_tbl[n-1] <<- fib_mem(n-1)
    fib_tbl[n-2] <<- fib_mem(n-2)
    fib_tbl[n - 1] + fib_tbl[n - 2]
  }
}

map_dbl(1:12, fib_mem)
