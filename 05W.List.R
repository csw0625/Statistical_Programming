##List objects
#can combine objects of different types(different modes & different data type)
#list object is vector(recursive)

list(mode='list',length) #empty storage,initialized list
x<- list(name='Kim',salary=6000,union=T) ##여러 sub object를 가지고 있음
x$name  #character
x$salary #numeric
x$union #logical value


#creating lists
x$name
x<-list('Kim',6000,T) ; x
##[[]]->list object에서 sub object의 이름 대신 활용됨 

x[[1]] # x의 첫번째 sub object

a<-1:3 ; b<-c('a','b','c') # 다른 타입의 데이터
x<-list(a,b) ; x

x<- list(N=a,K=b) ; x
x[[1]][1]  ##첫번째 sub object에서 첫번째 element
x[[2]][2]  ##두 번쨰 sub object에서 두번 째 element

x<-vector(mode='list',2) ; x

#List indexing
#Extracting components from list objects
#(1)-list$component
#(2)-list[[index]]  #이름이 있어도 순서로 해도 가능함
#(3)-list[['component]]
x<-list(name='Kim',salary=6000,union=T)
x$salary
x$sal  ## sub object에서s 로시작하는게 하나밖에 없음
x[[2]]
x[['salary']]


#single bracket[] can also access list components, result is another list,계산 진행 안됨
x[2]    ## x를 벡터 취급, 원소는 name,salary,union
x[1:2]  ## 첫번째 두번째 sub object보여줌
class(x[2]) ; class(x[[2]])
x[[1:2]] ##대괄호 두개는 인덱싱 하나만 가능
class(x[[2]])



##adding or deleting list components
#list components can be added by creating or concatenating(연결) them
#list components can be deleted by setting the to NULL

x<-list(a=1:2,b=c('a','b')) ; x
x$c<-rep(3,5) ; x 

y<- list(1:2) ; c(y,list(c('a','b')))  ##c()를 통해 list object들 끼리 결합  
list(c('a','b'))
#c() 는 벡터들끼리는 벡터 두개를 합치고 list 2개를 결합시킴(sub object로 붙힘)

x[[4]]<-c(T,F,F,T); x[5:6]<-c(7,3); x

x$c<- NULL ; x
x[3:5] <- NULL ; x



##list operations

# of components in a list: length() (list is vector), sub object의 개수를 알려줌
#names(): Names of list components
#unlist(): Accessing values in list components #각 sub object의 값들을 일렬로 눕혀서 벡터로 return

x<-list(a=1:2,b=c('a','b')); length(x) 
names(x)

y<-unlist(x) ; y ##vector로 리턴하기때문에 같은 포멧으로 강제 변환해서 돌려줌(numeric이 character로 바뀜)
is.vector(y)

x<- list(a=1:5,b=10:15)
y<- unlist(x) ; y
class(y)
names(y)<- NULL ; y #벡터 변환


##applying functions to lists
#lapply(list,function):apply function to each component of list->result:list object
#sapply(list,function):result:vector or matrix object

x<-list(a=1:10,b=c(5,8,1,7)) ; x 
y<-lapply(x,median) ; y ##리스트 형태임

y<-sapply(x,median) ; y ##벡터형태임
y<-unlist(lapply(x,median)) ; y
y<-sapply(x,summary) ;y
y<-lapply(x,summary) ;y


sapply(x,sort) ##sub object끼리 length가 달라서 matrix불가, list형태로 출력

lapply(x,sort)


x<-list(a=1:5,b=5:1)
sapply(x,sort)




##recursive lists:list within lists
x<-list(a=1:2,b=c('a','b','c'))
y<-list(x=c('k','j'))    #y의 sub object x는 밖의 x와 전혀 관련이없음
z=list(x,y) ; z          #list x와  y를 sub object 로 받는다는 의미임 #이런 형태의 구조 파악꼭하기(시험)

z[[1]]
z[[1]]$b ; z[[1]][[2]] ##둘은 동일한 출력값
z[[1]]$b[2]

##more about list object
x<-list(a=c(1,2),b=c(1,3,4)) ; x

x[[1:2]] ##1:2 = c(1,2) ->첫번째 sub object의 두번째 element

#how to name list elements in R language
data_list<-list(c('jan','feb','mar'),matrix(c(1,2,3,4,-1,9),nrow = 2),list('red',12.3)) ; data_list
names(data_list)<-c('monat','matrix','misc') ; data_list

#question
vec<-c(1:4)
str<-c('joy','peace','long-suffering','love')
make_list<-list(vec,str) ; make_list
names(make_list)<-c('vector','string') ;make_list

make_list[2]<-c('god','jesus','holysirit','love')  #두번째 sub object를 변경하고싶음
#where the problem is, only takes the first character 'god', whereas  i expect it to take all the character
#괄호 하나만 들어가서 sub object들의 content에 접근 안됨, 따라서 두번째 sub objec의 element를 다 바꾸고
#싶으면 대괄호 2번 해야댐
make_list[[2]]<-c('god','jesus','holysirit','love') ; make_list

#appending an element to a list
list1<- list(a=1,b=2,c=3)
list2<- list(d=4)
appended_list<-append(list1,list2) ; appended_list

#how to add a new value to each element of list in R?
list1<-list(x1=rnorm(50),x2=rnorm(50)) ; list1
new<-list(0.34,0.37) ; new
list1<-mapply(append,list1,new,SIMPLIFY = F) ; list1 
##각 sub object에append로 new를 붙임
list1<-mapply(append,list1,new) ; list1  ##simplyfy를 T(default)로 하면 matrix 형태로 나옴


##statistical outputs
#fit a simple linear regression model
y<-rnorm(50,0,1)
x<-rnorm(50,-0.5,0.5)
fit<-lm(y~x)  ##많은 content들이 들어가있음## list 형태로 되어있음
summary(fit)
##Y=ax+b
 typeof(fit) 
 names(fit) ##어떤 sub object가 있는지 확일 할 수 있음
fit$residuals
