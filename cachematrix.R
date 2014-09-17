### >>>>>>>>>> My Code for Assignment 2
##>>>>>>>>>>> Bruce Bouton
##>>>>>>>>>>> 9/17/14 4:20Pacifc 
#
# I've written the code to trap four conditions:
#  1, user didn't provide a 9 element vector "v" 
     # That it is not a general vector whose sqaure root = integer might be a future upgrade
#  2, v exists but the inverse isn't cached
#  3, v input is the same as the old v input, so inverse is cached
     # I wanted to check the inputs are the same for computational efficiency, vs. checking if the inverses are the same.
#  4, An inveses is cached but the v input does not match v cached so a new inverese is required.
#  
#
# makeCacheMatrix function that creates a matrix and cache the inverse.
# 
makeCacheMatrix <- function(x) {
     vC<<- v                 # create a global image of the input vector
     m <<- matrix(v,3,3)     # Create matrix m from vector v and cache in global
     mInv <<- solve(m)       # Compute inverse of m and cache in global
     
}



# cacheSolve  funtion
# requires a 9 element vector v
# checks if input v exists; otherwise through useful error
# checks if the inverse is already calculated (mInv is not empty)
# if mInv is empty, calculate inverse, put in mInv, print mInv
# if mInv is not empty, check input v is same as cached vC
# if same input go to ouput
# if vectors are different, compute new invers
# I added a print ouput (though not spec'd by customer) to give it somethins useful for the assignment

cacheSolve  <- function(x) {
     if(!exists("v")) {        #if no input vector exists throw useful error
          message("cacheSolve assumes a 9 element vector v exists")
          message("please input 'v<-c(args)' where args is 9 numbers seperated by commas.")
          message("Afterwards, please re-call cacheSolve(x)")
          return()           #Throws us out of the function
     }
     if(!exists("mInv")) {          # if mInv doesn't exist ...
          message("Inverse not cached; computing inverse")
          makeCacheMatrix(v)
                  
     } else {                       # if mInv does exist ...
          if(all(vC==v)) {               # the input vector matches the cached vector
               message("Inverse cached; retriving cached inverse")
               
          } else {
               message("Input vector not same as old; computing new inverse")
               makeCacheMatrix(v)
               
          }
          
     }
     message("the inverse of matrix")
     print(m)
     message("is")
     print(mInv)
}



