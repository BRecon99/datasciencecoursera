## Put comments here that give an overall description of what your
## functions do

## The first idea is to make the function signal that X is a matrix and set inv as the variable of the operation we want to do. Then, we close the system setting and get the matrix, then setting and get the operation that is to invert the matrix.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <- y
    inv <- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
## Now we apply the function solve to invert the matrix, first by using the inverse functions set in the MakeCacheMatrix and then applying the solve(matrix,...) function attributed to the variable inv of the operation.

cacheSolve <- function(x, ...) {
  inv <= x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  matrix <- x$get()
  inv <- solve(matrix, ...)
  x$setinverse(inv)
  inv
}
