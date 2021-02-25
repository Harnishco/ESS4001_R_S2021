#####
#Random Samples
#####

x=runif(50,0,200)
round(x,0)

y = round (runif(50,0,200),0)
y
length (x)

y

z = round (runif(10,1,29),0)
z


########
#Stratified Random Samples
########

burned = seq(1,100,by=1)
treated = seq(101,200,by=1) 
unburned = seq(201,300,by=1)

sb = sample(burned, 50, replace=F)
length(sb)
st = sample(treated, 50, replace=F)
length(st)
su = sample(unburned, 50, replace=F)
length(su)

####
#Subsample Dataset
####

setwd("D:\\ESS4001")
data = read.csv("Grass Height Data by Treatment.csv", header=T)
head(data)
View(data)

table(data$treatment)

data$plot

install.packages("tidyverse")
library(tidyverse)

b = filter(data, treatment=="burned")
View(b)

sbb = b[sample(nrow(b), 50, replace=F),]
nrow(sbb)
dim(sbb)
sbbb = sample_n(b, size=50, replace=F)
view(sbbb)

 colnames(sbb)

mean(sbbb$avg.grass.height)

#######
#log and rank variable transformations
#######

n = 1000
sk = rnbinom(n, 8, 1/2)
sk = data.frame(sk)

head(sk)
sk

library(ggplot2)

ggplot(sk, mapping = aes(x=sk)) +
	geom_histogram(color="black", fill="blue", bins=25) +
	theme_bw(base_size=20)

lsk = log(sk)
head(lsk)
dim(lsk)

x11() # opens new graphic "device"
ggplot(lsk, mapping = aes(x=sk)) +
	geom_histogram(color="black", fill="blue", bins=15) +
	theme_bw(base_size=20)
####
#Rank transformation
#

d = data.frame(round(runif(50, 0, 200), 0))
d
colnames(d) = "d"

min(d$d)
max(d$d)
median(d$d)

d$r = rank(d)

tree = data.frame(c(31.3,29.1,32.6,19.5,37.8,29.1))  # tree height data
tree
colnames(tree) = "Tree.Height"
tree$Height.Rank = rank(tree$Tree.Height)