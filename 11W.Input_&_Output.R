#Input & output





x<-scan('dat1.txt') ;x 
x<-scan('dat2.txt',what=character()) ;x

x<-scan('dat2.txt',what=character(),sep='\n') ; x ##한 줄을 하나의 element로 판단


#example for reading from the keyboard
##End of the input->empty line

x<-scan('')
1 2 3 #1-3번째 아이템
3     #4번째 아이템
4 5   #5-6번쨰 아이템
x 

x<-scan('',what=character())  #character
a b c 


#readline():read a single line from the keyboard and return a character object
x<-readline()
abc efg
x

x<-readline() #숫자도 character로 바뀜
1 2 3  #하나의 element 로 취급
x

name<-readline('Type your name:  ')
JJ
name


#print():To print objects in the body of functions,use print()
f<-function(x) print(x+10)
f(10)


#cat():concatenate and print outputs(multiple objects)
##\n:End-of-line character. if you do not use this, the next call would continue to print on the same line
##if you want to distinguish outputs,sep= can be used

print('abc') ;cat('abc')

x<-1:3 ; cat(x,'abc','def\n','z')
cat(x,'abc','def',sep='')
cat(x,'abc','def',sep='\n')
cat(x,'abc','def\n',sep=".") ;
f<- function(x) for (i in 1:3) cat(x+i)
f(10)

f<- function(x) for (i in 1:3) cat(x+i,'\n') ##줄 구분
f(10)



#read.table('data file',sep= ,header = T):reads a data frame from a file
x<-read.table('dat3.txt',sep=',' , header = T) ; x #파일에 변수명이 있으면 header=T

#readLines():read a character vector from a file. it reads one line at a time
readLines('dat3.txt') #각 observation


#reading a data frame from a file
##using scan()
##using read.table and as.matrix()

x<-matrix(scan('dat1.txt'),4,byrow=T)
x<-as.matrix(read.table('dat1.txt')) 

#connection:
##file('file name',open=)
##read(open='r') from a file and write (open='w') to a file by readLines() and writeLines(),respectively
x<-file('dat3.txt','r')
readLines(x,n=1)
readLines(x,n=4)
readLines(x,n=1)
close(x)


x<-file('dat3.txt','r')
readLines(x,n=2)
seek(con=x,where = 0) ##Back to the first line
readLines(x,n=1)
close(x)


##write
x<-file('dat4.txt','w') ##기존에 없는 파일인 dat4.txt이라는 빈 txt파일을 local file에 만듬
writeLines('abc\ndef',x) #추가하고싶은지 앞에 적고 connection명을 적음(abc 줄 바꾸고 def)
writeLines('ghl',x) ; writeLines('sex',x)
close(x)


#dat5.txt:column 1:ID, column 2-3: age, column 4-7:salary
dt<-data.frame(stringsAsFactors = F) ;x<-file('dat5.txt','r')
repeat{
  person=readLines(x,1)
  if (length(person)==0) break
  l=vector('list',3)
  names(l)=c('id','age','salary')
  l$id=as.factor(substr(person,1,1))
  l$age=as.numeric(substr(person,2,3))
  l$salary=as.numeric(substr(person,4,7))
  dt=rbind(dt,as.data.frame(l,stringsAsFactors=F))
}
close(x) ;dt

#read.table() and scan() accepts web URL as arguments
x<-read.table('http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data',sep=",") ; x

#writing a file
dt ;write.table(dt,'dat6.txt')
cat('e253700\n',file = 'dat5.txt',append=T)
x<-file('dat5.txt','a')
writeLines('f256700',x) ; close(x)

