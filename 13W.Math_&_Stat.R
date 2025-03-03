##Math_and_Statistic
y<-D(expression(exp(x^2)),'x') ; y #미분
eval(y)
prod(6,3,4)


#Exponential distribution
x<-rexp(200,rate=2) ; mean(x) ##모평균:0.5
hist(x,freq=F,ylim=c(0,2))
lines(density(x),col='red',lty=2,lwd=2) ##sample을 통한 추청치
x<-seq(0.01,5,0.05)
y<-dexp(x,rate = 2) ##lambda가 2인 지수분포의 밀도함수(모집단)
lines(x,y,type='l',col='blue',lwd=2) ##지수함수의 이론적인 라인
legend(1.5,2,c('Estimated density','Theoretical density'),col=c('red','blue'),lty=c(2,1),lwd=c(2,2))

#Example

#P(x<1), where X~exp(rate)
pexp(1,rate=2)

#Quantile:x value satisfying P(X<x) = P(e.g, p =0.5)
qexp(0.5,rate=2)

#Binomial distribution
x<-rbinom(500,10,0.3)  ##X~binomial(n=10,p=0.3)
mean(x) #mean of 500 samples following binom(10,0.3)
var(x)

dbinom(2,10,0.3) #p(x=2) 성공횟수 2번
pbinom(2,10,0.3) #P(X<=2)=p(0)+P(1)+P(2) /discrete distribution
qbinom(0.5,10,0.3) #x satisfying P(X<x)<=p or P(X<=x) >= p

#set operation
x<-c(1,2,3,3,4,7)
y<-c(2,2,4,6,9)
union(x,y) #합집합,중복제거 but sorting 안됨 
intersect(x,y) #교집합
setdiff(x,y) #차집합 (x,y 순서에 따라 다름)

setequal(x,y) #test for equality between x & Y -> logical
setequal(x,c(7,4,3,3,2,1)) ##순서가 달라도 TRUE

3 %in% y ##testing whether c is an element of set y

choose(6,2) ##combination
combn(x,2) ##all subsets with size k of the set x, x에서 원소개수가 k 개인 모든 부분집합들


#buffon's needle
buffon<-function(n,L){
  #n: # of replications-시행횟수
  #L: the length of the needle & the distance between lines
    d<-runif(n,0,L/2)
    theta<-runif(n,0,pi)
    x<-(L/2)*sin(theta)
    p<-sum(d<=x) / n  ## d가 x와 같거나 작은 경우의 수 / 총 시행횟수
    return(p)
}
#2/pi ##True value
buffon(100,3)
buffon(50000,3)
#->central limit theorem



#confidential interval
cfv<-function(n,R=100,mu=0,sd=1,alpha=0.05){ ##R=시행횟수, 
  B<-5* sd/sqrt(n)  #y축 길이(신뢰구간이 잡히게)
  k<-0
  plot(c(0,R+1),c(mu,mu),type='l',col='blue',lwd=2,ylim=c(mu-B,mu+B),xlab='Repetition',
       ylab='Confidential Interval',main="Simulation")
  for (i in 1:R){
    x<-rnorm(n,mean=mu,sd=sd)
    LB<-mean(x)+qt(alpha/2,n-1)*sd(x)/sqrt(n)                   #lower bound
    UB<-mean(x)+qt(1-alpha/2,n-1)*sd(x)/sqrt(n)                 #upper bound
    if (LB>mu | UB<mu) lines(c(i,i),c(LB,UB),col='red',lwd=2)   #mu가 신뢰구간 안에 포함되어있지않다면
    else{
      lines(c(i,i),c(LB,UB))
      k=k+1} ##포함될때만

  
  }
  sprintf('Coverage of Probability: %.3f',k/R)
}
cfv(n=10,R=100)
