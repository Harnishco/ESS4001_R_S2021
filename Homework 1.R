#######
#Homework 1
######


a = seq(2,100,by=2)
a
mean(a)

m <- c(-20, 32, 46, 989, 44, 33)

m

sum(m)

setwd("D:\\ESS4001")

install.packages("ggplot2") # install the package


moose = read.csv("moose.csv", header=T)

head(moose)

a = mean(data$moose.N)
round(a, 0)

head(moose)

length(moose[,1])
dim(moose)
class(moose)

library(ggplot2)

p1 = ggplot(data = moose, mapping = aes(x = moose.D, y = moose.recruit)) +
	geom_point(size = 10) +
geom_smooth(method=lm, se=TRUE, linetype="solid",
	color="blue", size=2) +
	theme_bw(base_size=20 +
	labs(x = "Moose Density", y = "Moose Recruited (r)")

p1


