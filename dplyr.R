install.packages(dplyr)

library(dplyr)
library(dplyr1)
?mtcars
dplyr::filter(mtcars, mpg>25 & am==1) #extracting rows with a condition
filter(mtcars, mpg>25 & am==1) #another way to do it

mtcars %>% filter(mpg>25 & am==1) #%>% means piping operator
mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt) #multi level
mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt) %>% summarise(n())
mtcars %>% filter(mpg>25 & am==1) %>% arrange(wt) %>% count()

mtcars %>% group_by(am) %>% summarise(mean(mpg))
mtcars %>% group_by(gear) %>% summarise(mean(wt))

# Multiple criteria----
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1)

# Multiple arguments are equivalent to and----
filter(mtcars, cyl < 6, vs == 1)


filter(mtcars, row_number() == 1L)
filter(mtcars, row_number() == n())
filter(mtcars, between(row_number(), 5, n()-2))


#mutate----
mutate(mtcars, displ_l=disp/61.0327) #adding another column
transmute(mtcars, displ_l = disp / 61.0237) #removes other cols
mutate(mtcars, cyl = NULL) #do not display cyl

#slice-----
slice(mtcars, 1L)
slice(mtcars, n())
slice(mtcars, 5:n())
slice(mtcars, c(2,4,5,10))

(by_cyl <- group_by(mtcars, cyl)) # ???
slice(by_cyl, 1:2)

#structure----
tbl_df(mtcars) # convert to tbl class
glimpse(mtcars)  # dense summary of tbl data
View(mtcars) # spreasheet like form base pacakge
mtcars %>% group_by(am) 
#nothing - just separation

mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt))


#summarise----
summarise(mtcars, mean(disp))  
summarise(group_by(mtcars, cyl), mean(disp)) 
summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))


#summarise_all
mtcars %>% group_by(am, gear) %>% summarise_all(mean)
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))
mtcars %>% group_by(am, gear)%>% summarise_all(funs(med = median))



#without Group
mtcars %>% summarise(mean(mpg), max(wt))
mtcars %>% summarise_all(mean)
mtcars %>% select(wt, gear)%>% summarise_all(c("min", "max"))
mtcars %>% summarise_all(funs(med = median))



#summarise if : 
mtcars %>% summarise_if(is.numeric, mean, na.rm = TRUE)
str(iris)  #Species is a factor
iris %>% summarise_if(is.numeric, mean, na.rm = TRUE)

#specific columns
mtcars %>% summarise_at(c("mpg", "wt"), mean, na.rm = TRUE)


#------------------------------------
#unsorted----
dplyr::tbl_df(iris)  #all rows not displayed
print(dplyr::tbl_df(mtcars), n=20)  #display more columns and rows
#print(dplyr::tbl_df(mtcars), width=11)
tbl_df(mtcars) %>% print(n = Inf)  #all rows
tbl_df(mtcars) %>% print(width = Inf)
tbl_df(mtcars) %>% as.data.frame(mtcars)

glimpse(mtcars)
df = mtcars
row.names(df) = NULL  #remove rownames
df %>% select(mpg)
#head(mtcars)
select(mtcars, mpg, vs)
mtcars %>% dplyr::select(vs, mpg, wt)
mtcars %>% group_by(cyl) %>% summarise(avgwt = mean(wt), meanhp = mean(hp)) %>% arrange( desc(meanhp), avgwt)
mtcars

names(mtcars)
filter(mtcars, mpg > 23 | wt < 2)
mtcars %>% filter(mpg > 23 & wt > 2)
mtcars %>% select(mpg, wt) %>% filter(mpg > 23) 
mtcars %>% 
  
  filter(iris, Sepal.Length > 7)
filter(mtcars, cyl == 4)

#distinct rows
distinct(mtcars)
(df3  = data.frame(a=c(2,2,3),b=c(2,2,1)))
distinct(df3)

#sampling
sample_frac(mtcars, 0.2, replace=T)
sample_n(mtcars, 60, replace=T) %>% select(mpg)
slice(mtcars,10:14)
top_n(mtcars,-2, mpg)  #least 2 mpg

select(mtcars, mpg) %>% arrange(desc(mpg))

