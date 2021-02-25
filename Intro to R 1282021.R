################
#Intro to R
#ESSS4001
#1/28/2021
###############

#Basic Mathematical Operations

1+1
2+2

b= 2+2
b

c <- 2+2 #### <- and = are same 
c

sum(2,2,4,7,10)

a = sum(2,2)


k=prod(4,2)  #Multiply
k
8^6
sqrt(10)#squareroot

x = c(1,2,3)   #c() is the concatenate function
x
mean(x) #mean function is the same as the average
sd(x) #standard deviation
xx = seq(0,25, by = 5)  #sequence function
xx
str(xx)  #str() function allows to examine the structure of an object
mean(xx)
sd(xx)



###############
#different formating of elements
################

k = c(6,4,2)
str(k)

m = c("a", "b", "c")  #character structure
m
str(m)

list(1, "A", 6)
list(1,3,2)

g = list("sally", "bill", "jim")
str(g)
g[[2]]

setwd("h:\\ESS4001")
wolf = read.csv("wolf.csv", head=TRUE)

head(wolf)

length(wolf[,1])
dim(wolf)    ####gives us sample size
class(wolf)

install.packages("ggplot2")  # install the package
library(ggplot2)

p1 = ggplot(data = wolf, mapping = aes(x = wolf.D, y = wolf.r)) + 
	geom_point(size = 5) + 
	geom_smooth(method=lm, se=TRUE, linetype="dashed", 	color="blue", size=2) +
	theme_bw(base_size=20) +
	labs (x = "Wolf Density", y = "Wolf Growth Rate (r)")
p1 