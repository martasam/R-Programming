## Put comments here that give an overall description of what your
## functions do

## This code is used to save inversion of matrix in enviroment if it was once calculated.
## It speeds running of programm up, if there is a need to use inverse of matrix
## more than once.

## Write a short comment describing this function

## This function is creating a list to store functions, which we can use on matrix
## (set, get, setInverse and getInverse).
## With this function we can store and get matrix and its inverse in different enviroment.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setInverse <- function(inverse) i <<- inverse
	getInverse <- function() i
	list(set = set, get = get,
		setInverse = setInverse,
		getInverse = getInverse)
}


## Write a short comment describing this function

## This functions check whether inverse of this matrix was already calculated
## and is stored in enviroment.
## If yes, it will return this inverse, otherwise it will calculate inverse
## and set this inverse in enviroment.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	i <- x$getInverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get()
	i <- solve(data, ...)
	x$setInverse(i)
	i
}
