#######
#Summarizing
#### ESS4001
#2162020
########

setwd("D:\\ESS4001")
bgs = read.csv("Badgers.and.Squirrels.csv", header=T)
head(bgs)
nrow(bgs)
str(bgs)
install.packages("tidyverse")

library(tidyverse)

#####
#Scatterplot
######

p = ggplot(data=bgs, mapping = aes(x=GS_Count, y = Badger_Count)) +
	geom_point(shape=19, size=5, alpha = 0.5) +
	theme_classic(base_size=20) + theme(axis.text = element_text(color=
	"black")) +
	labs(x = "Ground Squirrel Count", y = "Badger Count")
p


########
#Bar Plots - Two Groups
########

library(Rmisc)
install.packages("Rmisc")	

view(bgs)

m = group.CI(POSE ~ Badger_Presence, data=bgs, ci = 0.95)
m

x11()  ###Opens up a new device

p2 = ggplot(data=m, mapping = aes(x=as.factor(Badger_Presence), y=POSE.mean)) +
	geom_bar(stat="identity", width = 0.8, color="gray", size = 2,
		fill = "seagreen4") + #identity means use the actual values in the dataframe
	geom_errorbar(mapping=aes(ymin=POSE.lower, ymax=POSE.upper), width=0.3, size=1.5, color="gray") +

	ylab("POSE Cover (%)") + xlab("Badger Occupancy") +
	theme_classic(base_size = 25) +
	theme(axis.text = element_text(color="black")) +
	scale_x_discrete(labels=c("0" = "Absent", "1" = "Present"))
p2

#######
#Bar Plots- Three groups
#######

g = read.csv("Grass Height Data by Treatment.csv", header=T)
head(g)

table(g$treatment)

gh = group.CI(avg.grass.height ~ treatment, data=g, ci=0.95)
gh


g1 = ggplot(data=gh, mapping = aes(x=treatment, y=avg.grass.height.mean)) +
	geom_bar(stat="identity", width=0.8, color="gray", size=2, fill="yellow2", alpha=0.6) +
	geom_errorbar(mapping=aes(ymin=avg.grass.height.lower, ymax=avg.grass.height.upper), 
		width=0.3, size=1.5, color="black") +
	ylab("Grass Height") + xlab("Treatment") + theme_classic(base_size=25) +
	theme(axis.text = element_text(color="black"))

g1


#####
#Histogram - Discrete
######

view(bgs)

table(bgs$Badger_Count)

p3 = ggplot(data=bgs, mapping = aes(x=Badger_Count)) +
	geom_bar(color="black", fill="gray", size=0.5) +
	theme_classic(base_size=25) + theme(axis.text = element_text(color="black")) +
	labs(x="Badger Count", y = "Frequency") +
	geom_hline(yintercept=84, size=2, color="blue")
p3

####
#Histograms Continous
####

head(bgs)
view(bgs)

p4 = ggplot(data = bgs, mapping = aes(x=BRTE)) +
	geom_histogram(color="black", fill="lawngreen", bins = 20) +
	theme_classic(base_size=25) + theme(axis.text = element_text(color="black")) +
	labs(x= "BRTE Cover (%)", y = "Frequency")
p4

sum(is.na(bgs$BRTE))   ### $ is collumn###



####
#Histogram- Continouos by group
####

View(g)

bt = filter(g, treatment=="burned" | treatment=="treated")    ## | = or
View(bt)

p5 = ggplot(data = bt, mapping = aes(x=avg.grass.height, fill=treatment)) +
	geom_histogram(color="gray", alpha = 0.4, position = "identity", bins=15) +
	scale_fill_manual(values=c("orange", "green")) +
	theme_classic(base_size=25)+ theme(axis.text = element_text(color="black"),
		legend.position = "top") +
	labs(x="Avg Grass Height", y="Frequency")
p5
