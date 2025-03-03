#Additional techniques in functions

#recursion
#recursive function:a function that calls itself

#To solve a problem by a recursive function f():
#1) break the original problem into one or more smaller problems
#2) within f(), call f() on each of the smaller same problems
#3) within f(), piece together the result of (2) to solve the original problem

#Factorial function
rfact<-function(x){
  if (x==0) return (1)
  else return (x*rfact(x-1))
} ; rfact(5) ##-> 1*2*3*4*5



#sort function
qsort<-function(x){
  if (length(x) <= 1) return(x) ##termination condition
  element<-x[1]
  print(element)
  partition<-x[-1]
  print(partition)
  
  x1<-partition[partition<element]
  x2<-partition[partition>=element]
  print(x1)
  print(x2)

  
  x1<-qsort(x1) 
  x2<-qsort(x2)
  print(c(x1,element,x2))
  
  return(c(x1,element,x2))
} ; y<-c(4,7,2,9,7) ; qsort(y)



#replacement function

##Example
x<-1:3  ;names(x)<-c('a','b','c') ; x='names<-'(x,value=c('a','b','c')) ;x ##same way
##'names<-'() is a pre-defined function and this type of functions are called replacement function
getAnywhere('names<-')



##indexing
x<-c(5,7,1,4,5) ; x[3]<-4 ; x
x<-c(5,7,1,4,5) ; x<-'[<-'(x,3,value=4) ; x

##E.g
'cutoff<-'=function(x,value){
  x[x>value]<-Inf
  x
}

y<-c(88,45,200,30,150)
cutoff(y)<-100 ; y



#your own binary operators:just write a function whose name begins and end with %

'%ab2%'= function(a,b) a*b+2 ; 5 %ab2% 2
'%dist%' = function(x,y) sqrt(sum(x^2+y^2)) ; x=c(2,3) ; y=c(5,2) ;x %dist% y


#Anonymous functions:functions without the function name(typically functions with 1 line code)
f<-function(x) x/sum(x)
x<-matrix(1:12,4,3) ;apply(x,2,f) ; apply(x,2,function(x) x/sum(x))


#... in function arguments:a mechanism that allows variability in the arguments given to R functions(technically ellipsis)
f<-function(x){
  mx<-mean(x)
  sx<-sd(x)
  return(list(mean=mx,sd=sx))
}
x=c(3,6,NA,8,6) ; f(x)

f<-function(x,...){
  mx<-mean(x,...)
  sx<-sd(x,...)
  return(list(mean=mx,sd=sx))
}
f(x,na.rm=T)
