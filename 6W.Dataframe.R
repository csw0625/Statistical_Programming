###data frame

#data frame:format is similar to matrix, but each column may have different mode
#data frame is a list
#data.frame() :creating data frame object by combining vector and matrices
#stringsasFactors=F:when data frames are created from character vetor, character vectors are converted in factor
name<-c('kim','park','lee') ; age<-c(25,23,21) ; male<-c(T,F,T)
#4.0 이전에는 t가 디폴트
x<-data.frame(name,age,male,stringsAsFactors = F) ;x #character 그대로

#str():shows the structure of dataframe
str(x)

y<-data.frame(name,age,male,stringsAsFactors = T) ; str(y) #character가 factor 로 나옴

#accessing data frames->either list or matrix

x[[2]]  ##ages
x[2:3]
x$age

x[,2]
x[,2:3]

##operation of data frames
#very similar to matrix objects

#extracting
#indexing:if drop=F,data frame with one column->data frame (if not, it's vector)
#filtering
#subset():exclude obs. with NA

x<-data.frame(x1=c(6,3,6,4,9),x2=1:5,x3=7:11) ; x

#indexing
x[1:3,]

class(x[1:3,]) # data 
x[1:3,1] ; class(x[1:3,1])
class(x[1:3,1,drop=F])

#filtering
x[x$x1>=5,] ##조건을 list 형태로 할 때 
x[x[,1]>=5,] ##조건을 matrix 형태로 할 때

#subset
x<-data.frame(x1=c(6,3,NA,3,8),x2=1:5,x3=7:11) ; x


x$x1>=5
x[c(T,F,NA,F,T),]
x[x$x1>=5,]

subset(x,x1>=5) ##NA배제 



##removing OBS. with NA

#complete.cases(): Obs. that have at least one NA -> FAlse

x<-data.frame(x1=rep('a',5),x2=c(6,3,NA,3,NA),x3=7:11) ; x
complete.cases(x)

y<-x[complete.cases(x),] ; y
subset(x,complete.cases(x))

##Adding OBS
#rbind(): objects to be combined should be the same mode for each column
#both data frame & list objects are possible
#when all elements of data frame have the some mode, matrix or vector objects with that mode can be added (column names should be matched with data frame)

d1<-data.frame(name=c('kim','choi','park','lee'),
               age=c(22,27,24,32)) ; d1
d2<-data.frame(age=c(23,22),name=c('yoo','kang')) ;d2
rbind(d1,d2)

d1<-data.frame(name=c('kim','choi','park','lee'),
               age=c(22,27,24,32),stringsAsFactors = T) 
d2<-list(age=c(23,22),name=c('yoo','kang'))

rbind(d1,d2) ##data frame 형태로 나옴,첫번째 data frame의 class를 따름,list 를 붙여도 실행은 되지만 리스트에서는 character이기 때문에 NA값으로 나옴
rbind(d1,d2)

 #stringsasfactor가 서로 다른 데이터프레임을 rbind로 합치면 첫번째 프레임에 맟줘서 붙임

d1<-data.frame(x1=c(1,4,3),x2=1:3) 
d2<-matrix(0,2,2)
colnames(d2)<-c('x1','x2') ;
d3<-rbind(d1,d2) ; d3
class(d3) #dataframe


#cbind(): a vector or matrix(with one mode) can be added to data frame as columns
#dataframe$varname = vector object: creating and assigning a new variable
#새로운 변수를 갇다붙인다고해도 다른 type을 붙여도 상관없음
d<-data.frame(x1=c(1,4,3),x2=1:3)
cbind(d,matrix(1,3,2))
cbind(d,d$x1-d$x2)


d$diff<-d$x1-d$x2 ;d ##새로운 변수 입력 ;
names(d) ; names(d)[3]<-'x3' ; d #변수명 변경
cbind(d,x4= d$x2-d$x3) ##이렇게도 가능함
d[[4]]<-1:3 ; d ##리스트형태로 접근

d[5:6]<-matrix(1,3,2) ; d #복수의 변수 입력 (dimension 고려 필수)



##merging data frames

#merge():combine two data frames according to the values of common variable
d1<-data.frame(name=c('kim','choi','park'),age=c(22,27,24)) ; d1
d2<-data.frame(male=c(T,F,T),name=c('park','kim','kang')) ;d2

merge(d1,d2,by='name')
merge(d1,d2,by='name',all=T)
merge(d1,d2,by='name',all.x =T) 
merge(d1,d2,by='name',all.y = T)

#different names of ID
d1<-data.frame(name=c('kim','choi','park'),age=c(22,27,24))
d2<-data.frame(male=c(T,F,T),last=c('park','kim','kang'))
merge(d1,d2,by.x='name',by.y = 'last')

#duplicated ID
d1<-data.frame(name=c('kim','choi','park'),age=c(22,27,24))
d2<-data.frame(male=c(T,F,T),name=c('park','kim','kim'))
merge(d1,d2,by='name')

##applying functions
#apply():apply a function to each column or row of data frame->return a vector or matrix
#lapply():apply a function to each column of data frame->return a list

d<-data.frame(x1=2:5,x2=6:9,x3=c(5,8,1,5)) ;d
apply(d,1,mean)
apply(d,2,mean)

d<-data.frame(name=c('kim','park','choi'),age=c(22,27,24),stringsAsFactors = F) ;d
x<-apply(d,2,sort) ; x
x<-lapply(d,sort) ;x
x$name
x$age
as.data.frame(x)
as.list(x) #list로 바꿈
#as.data.frame() : conver objects into data frames
a=matrix(0,2,2); x= as.data.frame(a) ; a
is.data.frame(x)
