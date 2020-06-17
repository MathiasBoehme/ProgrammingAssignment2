## This is Mathias's code for week 3's coding assignment
## R Programming by Johns Hopkins University on Coursera

## Thanks a lot for checking my code.
## And best regards from Sydney, Australia

## This R code was created to calculate the invert of a matrix, using the
## solve() function, while keeping the result in the cache for further access
## makeCacheMatrix() initializes the matrix and support functions
## cacheSolve() then executes solve() or retrieves the inverted matrix from 
## the cache



## makeCacheMatrix creates a list object with getter and setter functions
## to store a matrix and an inverse matrix in the cache
## call arguments: a matrix (optional)

makeCacheMatrix <- function(m = matrix()) {     ## initialize object m as matrix
        
        inv_m <- NULL                ## initialize inv_m as NULL
                                     ## inv_m will store inverted matrix
                                     ## once set
        
        ## set new matrix
        setMatrix <- function(local_m) { 
                m <<- local_m        ## assign matrix to m
                inv_m <<- NULL       ## delete any previous inverted matrix
                                     ## from cache
        }
        
        ## get current matrix
        getMatrix <- function() m ## return the currently set
                                                   ## matrix
        
        ## set an inverted matrix
        setInvMatrix <- function(inv_m_to_set) inv_m <<- inv_m_to_set
                                         ## get a (inverted) matrix and assign
                                         ## it to the parent-object invmatrix
        ## get inverted matrix
        getInvMatrix <- function() inv_m
        
        ## return a list of the above created functions
        ## this also creates a symbolic link to the Local Environment (of this
        ## function)
        list(setMatrix = setMatrix,
             getMatrix = getMatrix,
             setInvMatrix = setInvMatrix,
             getInvMatrix = getInvMatrix
             )
} ## End makeCacheMatrix




## cacheSolve returns a matrix, that is the inverse of a given matrix in the
## makeCacheMatrix object
## In case the given matrix has been provided and inverted before,
## the cached result will be provided
## In case the given matrix is new, the inverted matrix will be calculated
## and cached for future use
## call arguments: a list created by makeCacheMatrix 

cacheSolve <- function(makeCacheMatrix.object, ...) {
        
        inv_m <- makeCacheMatrix.object$getInvMatrix()
                                ## get the current stored inverted matrix
                                ## if nothing stored yet, NULL will be assigned
        
        if(!is.null(inv_m)){ ## check if inverted matrix has been cached yet
                message("getting cached data") ## if yes, show message and
                return(inv_m)                  ## and return cached inverted
        }                                      ## matrix, finish execution here        
        
        ## in case no inverted matrix was cached yet, execution will continue..
        
        m <- makeCacheMatrix.object$getMatrix() ## get Matrix from
                                                ## makeCacheMatrix object
        
<<<<<<< HEAD
        
        if(all(is.na(m))) { ## check if any matrix is stored in m
                       ## if not show a warning and finish execution with NA
                warning(paste("Cannot find a matrix in",
                              substitute(makeCacheMatrix.object)))
                return(NA) ## just return NA
        }
        
=======
>>>>>>> e4713aa649f7e402100030b2fd81a5a10f38fa84
        inv_m <- solve(m,...)                   ## use solve() to calculate
                                                ## inverted matrix
        
        makeCacheMatrix.object$setInvMatrix(inv_m) ## store inverted matrix in
                                                   ## makeCacheMatrix object 
                                                   ## --> in cache
        
        inv_m ## return inverted matrix
        
} ## end cacheSolve