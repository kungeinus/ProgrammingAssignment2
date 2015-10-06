## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix will cache the dataset input and the inverse of the matrix.
## Function setmatrix will update the saved dataset and reset the cached inverse.
## Function getmatrix will pull out the cached data set.
## Function setinversed will save the inverse of the matrix.
## Function getinversed will pull out the cached inverse.
makeCacheMatrix <- function(matrixin = matrix()) {
  inv <- NULL
  setmatrix <- function(matrixset) {
    matrixin <<- matrixset
    inv <<- NULL
  }
  getmatrix <- function() matrixin
  setinversed <- function(inversed) inv <<- inversed
  getinversed <- function() inv
  list(setmatrix = setmatrix, getmatrix = getmatrix,
       setinversed = setinversed,
       getinversed = getinversed)
}


## Write a short comment describing this function
## Firstly test if cached inverse already exist. If not, which means the cached matrix was just initialized or 
## has been changed, new inverse is calculated. If yes, return the cached inverse.
cacheSolve <- function(Cachelist, ...) {
  inv <- Cachelist$getinversed()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- Cachelist$getmatrix()
  inv <- solve(data, ...)
  Cachelist$setinversed(inv)
  inv
}
