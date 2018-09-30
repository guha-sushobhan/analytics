# Data structures in R

# Vectors ----
X = 1:10 #create sequence of nos. from 1-10
X

x1 = 1:20
x1

(x1 = 1:30)
(x2 = c(1,2,13,4,5))
class(x2)

(x3=letters[1:20])

(x5=c('a',"Dhiraj","4"))
class(x5)  

(x6=c(1,FALSE,TRUE, 3,5))

x7=c(3L,5L)
class(x7)

#access elements
?seq
(x8=seq(0,100,by=3))
methods(class="numeric")

ls() #variables in my environment

length(x8) #find length of array
x8[20] #print 20th element
x8[c(2,4)] #print 2nd & 4th element
x8[-1] #print all except 1st
x8[-3] #print all except 3rd
x8[-c(3,5)] #print all except 3rd & 5th
x8[-(length(x8)-1)] #print all except 2nd last

(x9=c(X,x2)) #combines 2 vectors

rev(X) #prints it in reverse order

seq(-3,10,by=2)

x10 <- -3:2
x10
x10[2] <- 99; x10 #changes 2nd element to 99

x10[x10<0] = 5 ; x10 #modifying elements <0 by 5


x12 = seq(1:100); x12
(x13=seq(1,5,length.out = 10))  #delete vector

(x14=rnorm(500, mean=50, sd=0.5)) #normal distribution
plot(density(x14)) #plot the graph of a distribution
mean(x14) #finding mean
abline(v=mean(x14),h=0.3) #printing vertical & horizontal lines



# Matrices ----
(m1=matrix(1:12,nrow=4)) #creating matrix with 4 rows
(m2=matrix(1:24, ncol=6)) #creating matrix with 6 columns
class(m1)
attributes(m1) #rows & columns
dim(m2) #rows & columns

#acessing elements of matrix
m1[1,2:3] #extract 2-3 column element from row 1
m1[c(1,3),] #extract rows between 1 & 3, all columns
m1[-c(1,3)] #removing one attribute
paste("C",1:100,sep="-")
paste("c","d",sep = "-")
m2[1:5] #matrix is like a vector

m2[m2>5 & m2<10]
m2[c(T,F,T,T),c(2,3)]
m2[2,2]=10;m2 #changing an element

rbind(m1,c(11,22,33))

(rownames(m1)=paste("R",1:4,sep="")) #for rownames
(colnames(m1)=paste("C",1:3,sep=""))
m1

sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN = "+") #operations on rows
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN = "*") #operations on columns

addmargins(m1, margin = 1, sum)
addmargins(m1, margin = 2, mean)

addmargins(m1,c(1,2),list(list(mean,sum,max),list(var,sd))) #rows & columns


# Arrays ----

# Data Frames ----
#DataFrame----
#create Vectors to be combined into DF
(rollno = 1:30)
(sname = paste('student',1:30,sep=''))
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3))) #replace=T replaces the element you picked up, prob is the probability of picking up the element
(marks = floor(rnorm(30,mean= 50,sd=10)))
  (marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks ; marks2; course

#creating DF
df1=data.frame(rollno,sname,gender,marks,marks2,course, stringsAsFactors = F)
str(df1)
head(df1)
head(df1,n=3)
tail(df1)
summary(df1)

df1$gender=factor(df1$gender)
df1
summary(df1)
# Factors ----