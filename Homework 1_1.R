####
##Homework 1 try 2
#####


setwd("D:\\ESS4001")

moose = read.csv("moose.csv", header=TRUE)
head(moose) 
moose
View(moose)

install.packages("ggplot2")
library(ggplot2)

View(moose)

p1 = ggplot(data = moose, mapping = aes(x = moose.D, y = moose.recruit)) +
	geom_point(size = 3)

p1


