###3W

#vector(R에선 scalar가 vector에 포함됨,null vector도 포함됨)
x<-c(1,2,3)
x1<-4 # scalar
length(x) # vector의 길이, element의 숫자

x2<-7
x2
is.vector(x2) # scalar는 vector에 포함

x3=c('a','b','c') #character
is.vector(x3) #True
length(x3) #3

x4=c(T,T,T,F) #logical
is.vector(x4)

x5=vector('numeric',10) #vector function-> 초기에 미리 빈 벡터준비용
is.vector(x5)
x5

x6=vector('character',5) #character format을 갖는 길이 5의 벡터
x6


##indexing [] ->벡터의 n번쨰 값에 접근할 때 사용
x=c(2,-3,5,4,7,2,-1,2,9,0)

x[1] # 1번째 원소의 값
x[c(2,4,6,8)] #2,4,6,8 번째 원소의 값을 확인

idx=c(2,4,6,8)
x[idx]

y=x[2:5] #x의 2부터 5까지의 원소를 통해 subvector 만듬
y

x[-2] #2번째 요소 빼고 나머지를 return
x[-(2:5)] #2,3,4,5 번쨰 요소 뺴고 나머지
x[c(-2,-3,-4,-5)]
x[-c(2,3,4,5)]

##Manipulation of vectors
x =1:5 ; x 
y = c(x[1:3],3.5,x[4:5]) ; y #새로운 값을 특정부위에 추가, 3번째와 4번째 사이에 3.5라는 값을 추가
y = y[-c(1,3,4)] ; y

##matrix에서도 사용 가능함
x<-matrix(2,2,2) ; x
length(x) #element의 개수
x
x+1:4

##replacement of vectors
x= 10:1 # 10부터 1씩 감소하는 sequence
x[5]=0  # 5번째 element 변경
x[5:10] =0 ; x
x[5:10] = c(2,3,4,5,6,7) ; x

##vector operation(+,-,*,/,%%):element-wise operation->개별적인 element에 적용 됨
x =c(10,15,40) ; y = c(5,2,3)
x+y ; x-y ; x*y ; x/y ;x%%y  #x에서 y를 나눈 나머지

#응용
x+2 ; x+c(2,2,2) #recycling 됨


##기타 element-wise operators
x =c(9,2.2,3.7)
x^2 # 2승
x^(1/2) # 1/2승, 루트
sqrt(x) #루트
round(x) ; ceiling(x) ; floor(x) #반올림,올림,내림
log(x) ; log10(x) #밑이 e인 log, 밑이 10인 log




##Useful operators

#seq
seq(1,4)
seq(1,10,2) #1부터 10전까지 2씩 증가하는 시퀸스
seq(10,1,-2) #10부터 1까지 2씩 줄어드는 시퀸스
seq(1,10,length=5) ##1에서 10 사이 5개의 원소를 가지기 위해 동일하게 떨어져있는 5개의 원소출력

seq(c(1,2,3)) ##== 1:length(vector) 시퀸스를 생성함,
seq(c(10,5,7))
seq(c(NULL)) ##길이가 0이면 0 리턴 (NULL도 벡터에 포함됨)

#rep(vector,times=a) 벡터를 a만큼 반복함
rep(3,5)
rep(c(2,4,6),3)

#rep(vector,each=b) 벡터의 각 요소를 b번 반복함
rep(c(5,2,3),each=3)



##NA Not available, Missing data(결측치)
#element로 카운트 됨. NA값이 있으면 R function 오류발생
# 모든 format에서 쓸 수 있음
x=c(10,20,NA,30,40)
length(x) #NA는 element로 count됨
mean(x) #평균-> NA로 계산 불가
mean(x,na.rm = T) #NA값을remove

x=c(T,F,NA,T,F,F) #어느 format 이든 사용가능
x=c('a',NA,'c')



##NULL: Value do not exist (값 자체가 존재X)
#element에 포함 안됨. 있어도 R function 작동됨
#object를 처음 만들 때 유용하게 사용 가능
x =c(10,20,NULL,30,40)
mean(x)
length(x) #NULL은 element 수에 포함 안됨

x=NULL
for (i in 1:10) x =c(x,i) #첫번째에서 NULL
i



##Logical operator(논리연산자) TRUE or FALSE

#scalar 
x=1 ; y=2
x==y ; x!=y #Not equal to y
x<=y ; x>=y

#vector-> element-wise
x=c(1,2,3) ; y=c(4,5,3)
x == y
x !=y

x=c('kim','lee','park','choi')
x<'kim'                         #comparison by UTF-8 code(스펠링 순서)

x=c(1,5,10) ; y=c(3,5,7)
x == y ; x >= y



##all() : at least one FALSE->FALSE, all TRUE->TRUE
x=1:7 ; x
all(x>4) ; all(x>=1)

##any() : at least one TRUE->TRUE,all FALSE->FALSE
any(x>4) ; any(x>10)




##Identical(object, object)
#comparison for equality of two R objects(vector,matrix,array,list,data frame...)
#if everything such as value,mode,type, etc is the same,it returns TRUE
x=1:3 ; y=c(1,2,3) ; all(x==y) ; identical(x,y) 
typeof(x) ; typeof(y)   ##x는 정수 y는 실수이므로 indetical은 FALSE return




##Filtering : extracting elements satisfying certain conditions
#Filtering indexes : extracting elements by indexes
x=c(-2,7,5,0,-10) ; y=x[x>3] ; y
x[c(F,T,T,F,F)]     #x[x>3] 과 같은 거임

#assingment using filtering indexed: replacing elements by filtering indexes
x[x>3]<-10 ; x

#subset
#subset works in the same manner as the filtering indexes except of handling NA
x = c(-2,7,NA,5,0,NA,-10)
x[x>3] ;subset(x,x>3) ##subset 사용하면 NA 값을 제거함

#which(조건을 만족하는 element의 위치를 알려줌) : indexes of elements satisfying certain conditions
x = c(-2,7,5,0,-10) ; which(x>3)
x[which(x>3)] # 3이상인 element의 위치를 다시 인덱스에 넣어 값을 찾음
x = c('kim','lee','park','choi') ; which(x=='park') #character 에서도 사용



##ifelse(condition[element-wise이다],value for T,value for F): 조건이 맞으면 T-value,틀리면 F-value
# vector version of if-then-else statement
#returns a vector with the same length as the vector in condition
x = 1:10 ; y = ifelse(x %% 3 == 0,0,1) ; y

x = c('A','A','B','C','C','A') ; ifelse(x == 'A',1,0)



##sort(vector,decreasing=F)
#벡터의 element를 올림차순,혹은 내림차순으로 정렬함,default는 오름차순
x =c(3,1,5,7) ; sort(x) ; sort(x,T) #오름차순,내림차순
x =c('kim','park','lee','choi') ; sort(x) #스펠링 순서
##order(vector,decreasing=F)
#element의 크기 랭킹을 알려줌, default로 작은 수 부터 큰 수 순서로 알려줌
x= c(3,1,7,5) ; order(x) ; order(x,decreasing = T) #작은 수 순서,큰 수 순서



##vector element names:
#각 element들에 이름을 줄 수 있음 이를 통해 인덱싱에 사용할 수 있음,NULL로 이름 제거 가능
x = 1:3 ; names(x) = c('a','b','c') ; x
x[c('a','c')] # a와 c라는 이름을 가진 element 찾기
names(x) = NULL ; x #이름 삭제  
