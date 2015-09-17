## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(matrixset = matrix()) {
        inv <- NULL
        setmatrix <- function(matrixset) {
        matrixin <<- matrixset
        inv <<- NULL
        }
        getmatrix <- function() matrixin
        setinversed <- function(inversed) inv <<- inversed
        getinversed <- function() inv
        list(setmatrix = setmatrix, 
                getmatrix = getmatrix,
                setinversed = setinversed,
                getinversed = getinversed)
}


## Write a short comment describing this function

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
        ## Return a matrix that is the inverse of 'x'
}
