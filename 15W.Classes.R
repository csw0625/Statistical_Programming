#Class: 오브젝트의 정의
#generic: function: 특정한 method의 집합,여러 class에 사용가능 (class별로 다르게 작동) ex)동물에게 밥 먹이기
#Method: 특정한 caculation을 하는 function들의 집합                                    ex)각 동물별로 밥 먹이는 방법

methods(class='data.frame') #특정 class에서 사용할 수 있는 함수들
methods(class = 'ts') #공통으로 있는것들이 generic function

##S3
#a function to create a class object student
student=function(ID,sex,age,ht,wt)
{
  out= list(ID=ID,sex=sex,data=data.frame(Age=age,HT.cm=ht,WT.kg=wt))
  class(out) = 'student'
  invisible(out)
}

#print method for student class
print.student=function(object)
{
  cat('ID=',object$ID,'\nSex=',object$sex,'\n')
  print(object$data)
}

#plot method for student class
plot.student = function(object)
{
  data=object$data
  par(mfrow=c(1,2))
  plot(data$Age,data$HT.cm,type='o',pch=19,col='blue',
       xlab='Age (months)',ylab='Height (cm)',main='Height vs Age')
  plot(data$Age,data$WT.kg,type='o',pch=19,col='blue',
       xlab='Age (months)',ylab='Weight (kg)',main='Weight vs Age')
  mtext(paste('Subject',object$ID,",",toupper(object$sex),sep=""),
        side=3,outer=TRUE,line=-1.5,cex=1.5)
}

#student data
age=c(8,10,12,14,16,18)
male.wt=c(27.8,35.5,45.5,55.4,62.4,65.8)
female.wt=c(26.9,34.7,43.8,50.9,53.6,54.1)
male.ht=c(129.1,139.4,151.8,165.5,171.8,173.4)
female.ht=c(127.8,139.9,152.7,158.5,160.0,160.7)

#create student objects
x<-student(1,'male',age,male.ht,male.wt)
y<-student(2,'female',age,female.ht,female.wt)
class(x) ; class(y)

#print student objects
x ; y

#plot student objects
plot(x) ; plot(y)

#functions related to s3 class & method
methods(class='student')
methods(plot)

is(x) ; is(x,'student') ; is (x,'ts')
str(x)





##S4