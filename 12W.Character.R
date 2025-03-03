#character string:vector with character elements

#paste('c','c','c',sep=''):concatenating strings
#strsplit(vector,'seperator'):splitting strings by seperator
#grep(pattern,x,value=T/F):Matching patterns

paste('a','b') ; paste0('a','b')  #default는 한칸 띄어쓰기, paste0는 구분자 없음
x<-paste('kimcm','kimjy','kimhy',sep='/') ; x
y<-strsplit(x,'/') ; y

x<-c('kimcm','leejy','kimeh') ;grep('kim',x,value=F) ; grep('kim',x,value=T) 


#nchar():length of a string
nchar(x)#character vector x의 원소들의 길이를 알려줌
x<-'SKKU-STAT.  ' ; nchar(x) #작대기, 빈칸, 마침표도 포함됨

#sprintf():It combines strings in the formatted manner
sprintf('%d',10) ; sprintf('%i',15)
sprintf('%d',3.2)  ##error 발생
sprintf('%f',pi) ; sprintf('%.3f',pi) ; sprintf('%1.0f',pi)
sprintf('%5.1f',pi) ; sprintf('%05.1f',pi) ;sprintf('% f',pi)
sprintf('%e',pi) ; sprint('%E',pi)

x<-'abc'
sprintf('%s',x)
sprintf('%s is %.5f','pi',pi)

x<-3
sprintf('The square of %d is %d',x,x^2)

z<-23.5
sprintf('Today temperature is %2.1f degree',z)

#substr('string',start,stop): returns the substring in the given character position range stat:stop
#regexpr('pattern','string'):  returns the character position of the first instance of pattern in string
substr('Kim CM',1,3)
x<-'SKKU STAT.' ; substr(x,6,9)

regexpr('to','Top to bottom')


#gregexpr('pattern','string'):same as regexpr(), but finds all instances of pattern and returns a list object
gregexpr('iss','Mississippi')

x=gregexpr('iss','Mississippi') ; x[[1]]+3


#regular expression
#kind of wild card, shorthand to specify broad classes of strings
#Used in pattern matching functions such as grep(),regexpr(),etc....
grep('[kKe]',c('Kim CM','Choi HE','Park JH','Lee PY')) #[kKe]:'k' or 'K' or 'e'

grep('a.e',c('place','pitcher','ace','catcher')) #a.e: a (any character) e

grep('c..r',c('place','pitcher','ace','catcher')) #c..r: c(any character) (any character) r

grep('.',c('abc','de','f.g','h.jk')) #failed to find 'f.g' and 'h.jk' because '.' is metacharacter

grep('\\.',c('abc','de','f.g','h.jk')) #To escape the nature of metacharacter, use \\.


#Example:testing a file name for a given extension
extension<-function(fn,ext){
  #fn:file name
  #ext:file extension
  fn1<-strsplit(fn,'\\.')
  ext1<-length(fn1[[1]])
  return(fn1[[1]][ext1]==ext)
}
wd<-dir() #all file names in working directory
file<-NULL
for (i in 1:length(wd)){
  if (extension(wd[i],'R')) file = c(file,wd[i])
}
file
