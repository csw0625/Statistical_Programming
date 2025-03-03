a<-array(data = 1:12,dim = c(2,3,2)) ; a
 
A<-matrix(1:6,2,3) ; A
A<-matrix(,2,3) ; A

A[1,] <- rep(0,3) ;A
A[1,] <- c(2,3) ## 열의 길이랑 맞지않음 recycling은 하고싶은 수의 배수이어야 실행됨
A[,c(1,3)] <-2 ; A


##filtering 
# extracting a part of matrix satisfying a certain condition
#-> condition for column (row) should be in the position of row(column)

A<- matrix(1:20,4,5) ; A
A[,2]>7  ## 논리 연산
A[,A[2,]>7]  ## A[  , F,F,T,T,T] = A[,c(3,4,5)]  ##중요

A[A[,3]>=10 & A[,3]<=11,1:2] ## &로 조건 두개, 3번째 행에서 10보다 크고 11이하
A[,3]>= 10 & A[,3]<=11    #3번째 행에서 10보다 크고 11이하  
A[,3]<10 | A[,3]>11   ##or


x<-c(5,4,7,12)
x %% 2 == 1     ##T F T F 
A[x %% 2 == 1,] #1,3 행

l<- which(x %% 2 ==1) # logical값중 T가 몇번째인지 찾아줌
l  
A[l,]   ##A의 1,3번째 행


##apply(A,p,f,farg)
#applying functions to p-dimension of matrix or array
#m: matrix or array object, p:dimension code(e.g., matrix: row=1, column=2; p-dimension:1,2,..p)
#f: R function, farg:an optional set of arguments of f

A<- matrix(c(1:3,9,7,8,7,1:8),3,5) ; A
apply(A,2,sum) #A행렬의 열단위 합 return

apply(A,1,mean,trim=0.2) #A행렬의 행 단위으로 평균(양끝20%절삭한) return


##rbind():
#I Combine rows and create a matrix (vector & vector; vector & matrix).
#I Adding rows to the matrix (reassignment).

#cbind(): Combine columns and create a matrix.
##Rbind는 열의 크기,cbind는 행의 크기가 맞아야함

x <- c(1,5,2); y <- matrix(1:6,2,3)  ; x ; y
rbind(x,y) ## row bind  위아래 붙이기

x<-matrix(1:6,3,2) ; y<-matrix(9:1,3,3) ; x ; y
cbind(x,y)  ##좌우 붙이기


##transformation into vector or matrix
#when extractiong a row or a  column of matrix, then the extracted object is vector
#as.vector(): transformation of matrix or array into vector object
#as.matrix(): transformation of vector or array into matrix object

A<- matrix(1:6,2,3) ; A
x<-A[1,] ; x ; is.vector(x) #하나의 행이나 하나의 열만 뽑아낸경우 벡터임
x1<-A[,c(1,2)] ; is.vector(x) 

x<-as.matrix(x) ; x  #matrix 변환
x<-as.vector(x) ; x  #vector 변환

A<-array(1:8,dim=c(2,2,2)) ; A # 2차원 array

as.vector(A) # vector 변환
as.matrix(A) #matrix 변환


##names of matrix rows & columns
#rownames(matrix) = vector:names of matrix rows
#colnames(matrix) = vector:names of matrix columns
##숫자여도 character object임

A<-matrix(1:6,2,3) ; A
rownames(A)<-c('k','j') ; colnames(A)<-3:1 ;A 
A['j',]
A[,'3']

