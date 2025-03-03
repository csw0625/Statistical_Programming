
# Five basic formats of R objects
# 1.Character(문자) 2.Numeric(real number):4.00000...  3.interger(정수): 4 4.Complex(복소수) 5.Logical(T/F)

a=4L ## interger 4 -> 메모리가 덜 듬

## interger ⊂ Numeric

x=Inf ## 무한대
y=NaN ## Undefined value(Not a number-ex 0/0)
z=0/0 ##->NaN

b=2+3i
mode(b) ##복소수

c= F
mode(c) ##Logical


X=c(1,2,3)
Y=c(4,5,6)
Z=rbind(X,Y)
attributes(Z) ##특성을 알려줌 2*3 matrix 

# R data structure->List를 제외한 다른 구조는 포멧이 같아야함

##vector(⊃scalar)
X=c(1,2,3)
x=1 #scalar

##matrix
Z
##array

##List

##data frame-> Two dimension(row:observation column:variable) Both numeric,character


