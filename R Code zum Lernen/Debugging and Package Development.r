# Debugging
# Introduction t R functions: http://www.biostat.jhsph.edu/~rpeng/docs/R-debug-tools.pdf
options(error=recover) # lets one poke arround after an error was thrown, reset to options(error=NULL)
traceback() # to find out which function has thrown an error
debug(function) # to debug a function line by line, commandos then: (n)ext line, (c)ontinue whole function, (Q)uit debugging, (where) similar to traceback, (R commandos)
browser() # for not going line by line through function but for one point browsing in the function
trace # insert some (debugging) code in another function "on the fly", for details http://www.biostat.jhsph.edu/~rpeng/docs/R-debug-tools.pdf, p. 11 and read full R help
recover # to find errors in previous function calls

# Package development
library(tools)
library(devtools)
check()
# bzw. R CMD check package directory