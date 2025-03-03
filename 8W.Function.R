#function
#built-in functions,user-define function

#loops
##for
x<-c(5,6,10,7,12); z<- NULL
for (i in x) {z<-c(z,i+3)} ;z

x<-c(5,6,10,7,12); z<- NULL
for (i in x) {
  z<-c(z,i+3)
  if (i >=10) break
}
z

x<-c(5,6,10,7,12); z<- NULL
for (i in x) {if (i >=10) next ; z<-c(z,i+3)
}
z

##while
x<-0
while (x <5) {x<-x+1} ; x

x<-0
while (x <5){
  x<-x+1 ; if (x>3) break
} ; x

x<-0
repeat{
  x<-x+1; if (x >= 5) break
  
} ; x

##more about for (i in x) {}:
#if x has data file names,we can iteratively read the files corresponding  to the names
#it is possible to lop over nonvector object using get()
# get():it takes as an argument the name of some object and returns the object of that name
a<-matrix(1,2,2) ; b<-array(2,dim=c(2,2,3)) ; z<-NULL
for (i in c('a','b')) {y<-get(i) ;z<-c(z,sum(y))}


##if else
#if (condition) {statements1} else {statements2}:
#condition should return a single T or F
#if condition T,statements1 performed, Otherwise, statesment2 performed
#can work as a functions call(e.g, y= if (condition) expr1 else expr2 where expr1 & expr2 could be function object
r<-3
if(r==4){
  x<-1
} else {
  x<-3
  y<-5
}
x ;y


x<-c(5,7,2,9,10)
y<- if(x[3]>=3) x else x+2 ##하나의 변수으로 받을 수 있음
y

z<-if (sum(x)>30) mean(x) else sd(x)
z


##boolean operators for scalar
#x & y: AND ; x|y: OR; logical vector   ->벡터의 각각의 element별(자리에 맞게)로 logical condition 적용 
#x && y: AND ; x||y: OR; logical scalar ->각 벡터의 첫번쨰 element만 봄
#if x and y are vectors, && and || work for the first elements of x and y
x<-c(2,5,4) ; y<-c(1,7,3) ##벡터의 각각의 element 별로 logical condition 적용
x>3 & y<2   ## FTT & TFF ->FFF  ##두 logical vector에서 각 자리에 F가 있으므로 FFF # AND 모든 조건이 만족
x>3 | y<2   ## FTT | TFF ->TTT  ##두 logical vector에서 각 자리에 T가 있으므로 TTT # OR 하나의 조건이 만족

 
x>3 && y<2  # F & T -> F
x>3 ||y<2   # F & T -> T

x[1] >3 && y[1]<2
x[1] > 3 || y[1]<2

##logical value(can change to 1 and 0 respectively)
x<-c(6,2,9,4,3)
sum(x>=3)
(x[1]>0) + (x[2]>1)*(x[3]<10) * 2
(1<2) ==T
(1<2) ==1



#default values for arguments in function
##if you wnat to give default values for arguments in your function,sepcify default valeus when you define the function
avg<-function(x,na.rm=F)  #default 값 세팅
{
  if (na.rm ==T) {x<-x[!is.na(x)]}   ##!is.na(x) -> logical vector, NA가 아닌 값들만 T
  mean<-sum(x) /length(x)
  return(mean)
}
x<-c(1,3,7,5,NA,9)
avg(x) ;avg(x,na.rm = T)




#return
##return values of a function can be any R objects
##multiple results-> list object
##even function objects can be return values
##you can avoid explicit calls to return () ->Not a good approach
avg<-function(x)
{
  mean<-sum(x)/length(x)
  mean
}
x<-1:20
avg(x)


summary.stat<-function(x){
  result<- list(n=length(x),avg=mean(x),
  quartile=quantile(x,probs = c(0.25,0.5,0.75)))
  return(result)

}
z<-summary.stat(x) ; z



#functions are objects
#since functions are object with class 'function',
##if you type the name of function, you can see the function body 
##you can assign functions to other objects
##you can use fuctions as arguments of other functions 

g<-function(){
  t<-function(x) return(x^2)
  return(t)
}
g()


avg<-function(x)
{
  mean<-sum(x)/length(x)
  mean
}

avg

f1<-function(x,y) return(x*y)
f2<-function(x,y) return(x/y)
f<-f1 ; f(4,2)
f<-f2 ; f(4,2)
g<-function(z,x,y) return(z(x,y))
g(f1,4,2)
g(f2,4,2)

f1<- function(x) return(sin(x))
f2<- function(x) return(sqrt(x^2+1))
f3<- function(x) return(x*x-1)
plot(c(0,1),c(-1,1.5), type='n',xlab = 'X',ylab = 'Y')
for (f in c(f1,f2,f3)) plot(f,0,1,add=T)
