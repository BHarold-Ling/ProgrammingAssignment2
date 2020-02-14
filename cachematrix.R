## This set of functions serves as a wrapper for matrix that caches
## the inverse of the matrix


## This is the wrapper function

makeCacheMatrix <- function(innerMatrix = matrix()) {
    inv <- NULL
    set <- function(newMatrix) {
        innerMatrix <<- newMatrix
        inv <<- NULL
    }
    get <- function() innerMatrix
    
    # To set and get inverse
    set.inv <- function(newInv) inv <<- newInv
    get.inv <- function() inv
    
    # list of inner functions for calling code
    list(set = set, get = get,
         set.inv = set.inv,
         get.inv = get.inv)
}


## This is a wrapper for solve that uses the matrix wrapper above
## and returns the inverse.

cacheSolve <- function(x, ...) {
        inv = x$get.inv()
        if (is.null(inv)) {
            inv = solve(x$get())
            x$set.inv(inv)
        }
        inv
}


