#Environment & scope
search() 
##order of finding a value corresponding to symbol,library로 어떤 패키지를 불렀을 떄 그 패키지가 두번째 자리에 추가됨
##추가적으로 설치한 package에서 의도치 않게 내가 지정한 symbol과 같은 symbol이 사용되어 잘못된 값이 나올 수 있음 

#variables in functions
z<-1
f<-function(x){
  y<-2*x/z ; return(y)
}                           ##x:formal parameter y:local parameter z:free variable
##Problem:which z should we use if z is defined in more then one environment???
#A:The scoping rules determine how values are assigned to free variable


##scoping rules->어느 순서로 찾는가
#lexical scoping->function이 define된 곳에서 찾음 (R,python...)
#dynamic scoping->function을 호출한 곳에서 찾음

#E.g
y<-10
f<-function(x){
  y<-3
  2*y+g(x)} ##f에서의 y 는 3
g<-function(x) x*y ##->g 에서의 y는 10
f(3)  ## 2*3+3*10 = 36
##R support lexical scoping


#Example-1
x<-5 ; y<-3
f<-function(x) x+y
f(2)  #free variable y found in the global environment

#Example-2
y<-4
f<-function(x){
  y<-7 ; g(x)
}
g<-function(z) y+z
f(3) #free variable y found in the global environment

#Example-3
y<-4
f<-function(x) {
  y<-7
  g<-function(z) y+z
  g(x)
} ; f(3) #free variable y found in the function f environment

#Example-4
f<-function(x) apply(iris[,1:4],2,mean)+x
f(5) ##Free variable iris found in search path

#Example-5
pow<-function(n) {
  po<-function(x) x^n
  po
} ; cube<-pow(3) ; square<-pow(2)
cube(4) ; square(4) ##function pow returns another function po as its value



#exploring function closure
#environment(function):it returns the name of the environment of function
#ls(environment):it returns objects names in the environment
#get('object',environment):it returns the value of the object in the environment
pow<-function(n){
  po<-function(x) x^n
  po
}
cube<-pow(3) ;square<-pow(2)

environment(cube) ; environment(square)
ls(environment(cube)) ; ls(environment(square)) 
get('n',environment(square)) ; get('n',environment(cube)) # n have different values because they are in different environments

ls() ##현재 global environment에 정의되어있는 object들의 이름


#NO pointers in R
#pointer:A variable that contains the address of a location in computer memory (R doesn't have pointers)
x<-1:10 ; y<-1:5
lxy<-list(x=x,y=y)
f<-function(lxy){
  x<-lxy$x+5; y<-lxy$y+3; lxy<-list(x=x,y=y)
  return(lxy)
}
f(lxy) ##lxy는 formal parameter 라 update 되지만 f안의 x와 y는 local variable이므로 밖의 x y 와 별개이다
f
x<-f(lxy)$x ; y<-f(lxy)$y # x 와 y값을 이렇게 변경해야함


#writing upstairs
#codes at a certain level of the environment can read all the variables at the levels above it
#However it cannot write variables at higher levels of environment via '=' or '<-'

#writing upstairs "<<-" :superassignment operator, assign()
k=7
f<-function(k){
  k<<-k+3    ##상위 environment의 k까지 업데이트
  y<-2*z
}
w<-2 ; z<-4 ; k
f(w)
k  


f<-function(k) {
  assign('k',k+3,pos = GloblaEnv)
  z<-2*z
}

