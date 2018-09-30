grades=sample(c(LETTERS[1:4]),size=30,replace = T,prob = c(0.4,0.2,0.3,0.1)) #array
grades
grades=factor(grades) #converting to factor
summary(grades)
class(grades)
gradesFO= factor(grades,ordered = T) #ordered factor
gradesFO
gradesFO1=factor(grades,ordered = T,levels = c('B','C','A','D')) #changing the order of grades
gradesFO1
summary(gradesFO1)

(marks11=ceiling(rnorm(30,mean = 60,sd=5))) 
(gender11=factor(sample(c('M','F'), size = 30, replace = T)))
(student1=data.frame(marks11,gender11,gradesFO1))
boxplot(marks11~gradesFO1, data = student1) #creating a boxplot; ~ represents plotting one wrt other
boxplot(marks11~gradesFO1 + gender11, data = student1)
#ordering the factors gives us the convenience of seeing the boxplot as we want to see it
summary(marks11)
boxplot(marks11)
abline(h=summary(marks11))
quantile(marks11)
