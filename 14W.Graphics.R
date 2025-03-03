#empty frame
plot(c(0,10),c(0,20),type='n',xlab='X',ylab='y',main='Practice')

#add points
#cex: size if points, pch:type of point
points(c(6,8,10,6,8,10),c(5,10,15,10,15,20),col='brown',cex=2,pch=20)

#add lines
#lwd: dith of lines
lines(c(0,4,4,0,0),c(5,5,15,15,5),col='red',lwd=2)
lines(c(1,3,3,1,1),c(7,7,12,12,7),col='blue',lwd=3,lty=2)

#scatter plot:plot() function with two vectors for x & y axes
n=100
x=runif(n,1,10)
y1=0.5*x+rnorm(n) ; y2=5-0.5*x+rnorm(n)
plot(x,y1,xlab='X',ylab='Y')
points(x,y2,col='blue',pch=20)

#line graph
time<-1:10
stock1<-c(15,20,17,10,20,21,18,23,25,29)
stock2<-c(10,18,11,22,27,12,25,29,26,23)
plot(time,stock1,type='b',xlab='Time',ylab = 'Stock price')
lines(time,stock2,type='b',col='red',lwd=2,lty=2)
legend(8.5,15,c('A','B'),col=c('black','red'),lty = c(1,2),lwd=c(1,2))

#bar chart
x<-c(100,250,200)
barplot(x,names.arg = c('a','b','c'),ylab="products",main='Products by factory',col=5:7) ##col recycle 할수있음(색깔번호있음)

barplot(x,horiz = T,names.arg = c('a','b','c'),xlab="Products",main="Products by factory")

x<-matrix(c(1,2,3,4),2,2)
barplot(x,beside = T,horiz = T,names=c('a','b'))
barplot(x,horiz = T,names=c('a','b')) ##beside 삭제시 stack형태로 되어버림


#histogram
x<-rnorm(1000)
hist(x,main="Normal Distribution",freq = F,breaks = 30) #breaks를 늘릴수록 더욱 smooth하게 만들수있음
lines(density(x),col='red')
summary(density(x)) ##좌표개수 알려줌

x1<-rnorm(100)
x2<-rnorm(100,0.5,2)
#투명한 색 만들기
myblue<-rgb(0,0,255,max=255, alpha = 125) ##alpha가 투명도
myred<-rgb(255,0,0,max=255, alpha = 125)

hist(x1,main="Normal Distribution",freq = T,breaks = 20,col=myblue,xlim=c(-5,6)) 
hist(x2,main="Normal Distribution",freq = T,breaks = 50,col=myred,add=T) #기존 plot에 같이 그리기 
legend(3,10,c('Mean:0,Sd=1','Mean=0.5,Sd:2'),col=c(myblue,myred),pch=c(15,15))
text(-4,6,'Yay!!!',cex = 4)

#pie chart
x<-c(100,300,300,500)
pct<-paste(round(x/sum(x)*100,1),'%')
pie(x,labels = pct,col=c('red','blue','green','yellow'),main="Pie chart")
legend(1,0,c('A','B','C','D'),fill=c('red','blue','green','yellow'))


#box plot
x<-rnorm(100) ; y<-rnorm(100,mean=3,sd=2) ;z<-rnorm(100,mean = -1, sd=1.5)
boxplot(x,y,z,names=c('A','B','C'),col=c('blue','red','green'))



#additional issues
#text():add character to plots
#par(mfrow=c(p,q)):if you perform this commend you can draw multiple(p*q) plots on a single frame
x<-cbind(rnorm(100),rnorm(100),rnorm(100))
par(mfrow=c(1,3),mar=c(4,4,2,2),oma=c(0,0,2,0))
##여백활용도 중요함,mar=c(밑,왼쪽,위,오른쪽)을 통해 margin setting 하기,oma=outer margin 설정
for(i in 1:3) hist(x[,i],main="")
mtext('Example',side=3,outer=T)
mtext('Example',side=1,line=4) ##side 1에 text 추가,line에서 얼마나 떨어져 나오는지에 대한 변수


  