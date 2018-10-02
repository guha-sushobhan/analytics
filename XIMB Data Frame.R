#Practice Exercise - XIMB
#Create a 100 row DF wit hthe following variables
#gender, sp1, age, experience, grade, placement
gender = factor(sample(c('M','F'), size = 100, replace = T))
gender
summary(gender)

sp1 = factor(sample(c('Marketing','Finance','HR'), size = 100, replace = T))
sp1
summary(sp1)

age = floor(runif(100,21,30))
age
summary(age)

experience = floor(rnorm(100,4,1))
experience
summary(experience)

grades = sample(c(LETTERS[1:4]), size=100, replace = T)
grades
grades = factor(grades, ordered = T, levels = c('D','C','B','A'))
summary(grades)

placement = factor(sample(c('Yes','No'), size = 100, replace = T))
placement
summary(placement)

students = data.frame(gender, sp1, age, experience, grades, placement)
head(students)
str(students)
summary(students)

write.csv(students,"./data/XIMB Student Data.csv")

#summarize data in various ways using dplyr
library(dplyr)
names(students)
str(students)
students %>% group_by(gender) %>% summarise(mean(experience), max(experience), mean(age))

#draw graphs to understand data
hist(students$age)
t1 = table(students$placement)
barplot(t1, col = 1:2)
boxplot(students$age)
par(mfrow=c(2,2))
pie(table(students$gender))
pie(table(students$placement))
pie(table(students$age))
pie(table(students$sp1))
par(mfrow=c(1,1))

table(students$gender, students$placement, students$sp1)

#find students having highest exp in each specialisation for each gender
students %>% group_by(sp1, gender) %>% arrange(sp1, gender, experience) %>% top_n(1, experience)

students2 = read.csv("./data/XIMB Student Data.csv")
head(students2)

#clustering
km3 = kmeans(students[,c("age","experience")], centers = 3)
km3
km3$centers
plot(students[,c("age","experience")], col=km3$cluster)

#decision tree
library(rpart)
library(rpart.plot)

tree = rpart(placement~. , data=students) # ~. means plotting against all other variables
tree
rpart.plot(tree, nn=T, cex = 0.8)
printcp(tree)
prune(tree, 0.01)
tree
ndata = sample_n(students, 3)
ndata
predict(tree, newdata=ndata, type='class')
predict(tree, newdata=ndata, type='prob')

#logistic regression
logitmodel1 = glm(placement~.)

#linear regression
linear1 = lm(age~. , data = students)
summary(linear1)
