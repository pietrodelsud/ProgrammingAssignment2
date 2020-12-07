##A pair of functions that cache the inverse of a matrix


##Creates a special matrix object that can cache its inverse through:
##setting the value of the matrix
##get the value of the matrix
##set the value of the inverse
##get the value of the inverse

makeCacheMatrix <-
  
  function(m = matrix()) {
    
    ## Initialize the inverse property
    inv <- NULL
    
    ## Method to set the matrix
    set <- function(matrix) {
      m <<- matrix
      inv <<- NULL
    }
    
    ## Method to get the matrix
    get <- function() {
      ## Return the matrix
      m
    }
    
    ## Method to set the inverse of the matrix
    setInv <- function(inverse) {
      inv <<- inverse
    }
    
    ## Method to get the inverse of the matrix
    getInv <- function() {
      ## Return the inverse property
      inv
    }
    
    ## Return a list of the methods
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
  }


##The following function calculates the inverse matrix created with the above function. However, 
##it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, 
##it calculates the inverse of the data and sets the inverse in the cache via the setInv function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInv()
  
  ## Just return the inverse if its already set
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  
  ## Calculate the inverse using matrix multiplication
  m <- solve(data) %*% data
  
  ## Set the inverse to the object
  x$setInv(m)
  
  ## Return the matrix
  m
}
