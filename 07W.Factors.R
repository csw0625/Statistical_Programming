###factor
x<-c(5,10,5,8,10) ; y<-factor(x) ; y #여기서 더이상의 level 추가 불가,x의 element만으로 level 지정
str(y)
unclass(y) ##y의 레벨만

length(y) ; length(levels(y)) ##1.element의 갯수 2.level의 개수

z<-factor(x,levels=c(5,8,10,15)) ;z  #level추가 기능
z[5]<-15 ; z
z[5]<-12 #존재하지 않는 level(warning),z[5] NA로 바뀌어버림


##tapply(x(벡터),f(factor variable),g(내장함수)) 
#apply function g to vector x by each level in factor f
#벡터 하나에만 적용할수밖에없음(matrix,data.frame 불가),f와 x 의 길이가 같이야함
#factor variable의 벡터를 자동적으로 factor로 변환함

score<-c(92,84,80,67,80,75,60,93,77,84) #x 
dept<-c('a','b','b','c','a','c','a','b','c','a') #f
tapply(score,dept,mean) #각 level별로 mean 적용

d<-data.frame(gender=c('m','f','m','f','f','m'),
              age=c(37,27,33,28,37,29),
              salary=c(5200,3500,4700,3100,4600,4800))
d$age30<-ifelse(d$age>30,1,0) ; d$age30
tapply(d$salary,list(d$gender,d$age30),mean) ##list안의 sub object를 factor로 변환

##split(x,f) split data frame or vector x into group by each level in a factor f, returns a list of group
d<-data.frame(gender=c('m','f','m','f','f','m'),
              age=c(35,27,33,28,37,29),
              salary=c(5200,3500,4700,3100,4600,4800))
d$age30<-ifelse(d$age>30,1,0)

split(d,d$gender)
split(d,list(d$gender,d$age30)) # 두개에도 적용 가능


##by(x,f,g) apply function g to data frame or matrix x by each level in factor f (tapply():x should be a vector)
by(iris[,1:2],iris$Species,cor) #cor-> 공분산, class는 'b'

#table(x): contingency(or frequnecy) table for factor or list of factor x
x<-c(5,12,15,12,5,5,15,12,15,5)
table(x) #level별로 가지고있는 element의 개수

x<-data.frame(vote=c('y','y','n','y','n'),age20=c(0,1,1,0,0),
              party=c('D','R','D','D','R')) ##제일 뒤의 열 기준으로 그룹화 진행
table(x) 
  

#table object는 행렬이나 데이터 프레임과 같은 방식으로 운영된다
x<-list(vote=c('y','y','n','y','n'),age20=c(0,1,1,0,0))
tb<-table(x) ; class(tb) #table class
tb; tb[1,] # 1행은 factor level

tb/sum(tb)
apply(tb,2,sum) #열 방향으로 sum 적용

addmargins(tb)
dimnames(tb) #축의 이름

dimnames(tb)$age20=c('n','y') ;tb  #age20의 0과 1을 'n','y' 로 변경


##aggregate():call tapply() once for each variable in a group
##cut(x,i,labels=F):assign element of the vector x into an interval(elements) of the vector i

aggregate(iris[,-5],list(iris$Species),median)


#cut <-level의 범위 지정
x<-c(2,5,10,15,19,3,17,11,8,6)
y<-seq(0,20,2)
cut(x,y) ##어느 interval에 해당하는지 보여줌
cut(x,y,label=F) #x벡터의 element가 몇번째 구간에 속하는지 알려줌
