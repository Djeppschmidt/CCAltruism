# Community Cohesion, Resilience and Climate Change

Parse_tables<-function()

altruist.data<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherenceAltruist_climate_ramp-table.csv")


miser.data<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherenceMiser_climate_ramp-table.csv")
miser.data2<-miser.data %>% group_by(X.run.number.) %>% summarize("max.food"=mean(max..Harvest..of.misers), "min.food"=mean(min..Harvest..of.misers), "failures"=sum(count..misers..with..Harvest....0.), "hardship"=mean(hardship)) %>% group_by(hardship)

library(dplyr)
library(ggplot2)

altruist.summary<-altruist.data %>% group_by(X.run.number.) %>% summarize("max.food"=mean(max..Harvest..of.altruists), "min.food"=mean(min..Harvest..of.altruists), "failures"=mean(count..altruists..with..Harvest...0.), "hardship"=mean(hardship), "disparity"=mean(max..Harvest..of.altruists)-mean(min..Harvest..of.altruists)) %>% group_by(hardship) %>% summarize("max.food"=mean(max.food), "min.food"=mean(min.food),"err.fail"=sd(failures), "failures"=mean(failures),"err.disp"=sd(disparity), "income.disp"=mean(disparity))

altruist.summary$Type<- c(rep("Altruist", 20))

miser.summary<-miser.data %>% group_by(X.run.number.) %>% summarize("max.food"=mean(max..Harvest..of.misers), "min.food"=mean(min..Harvest..of.misers), "failures"=mean(count..misers..with..Harvest....0.), "hardship"=mean(hardship),"disparity"=mean(max..Harvest..of.misers)-mean(min..Harvest..of.misers)) %>% group_by(hardship) %>% summarize("max.food"=mean(max.food), "min.food"=mean(min.food), "err.fail"=sd(failures), "failures"=mean(failures),"err.disp"=sd(disparity), "income.disp"=mean(disparity))

miser.summary$Type<- c(rep("Miser", 20))
data<-rbind(altruist.summary, miser.summary)

p<-ggplot(data, aes(x=hardship, y=failures, group=Type))+geom_line(aes(color=Type))+geom_point(aes(color=Type))+theme_classic()+ scale_color_grey()+ggtitle("Mean number of agents without food each round as a function of environmental hardship")+geom_errorbar(aes(ymin=failures-err.fail, ymax=failures+err.fail), width=.1, 
    position=position_dodge(0.05))
p

p2<-ggplot(data, aes(x=hardship, y=income.disp, group=Type))+geom_line(aes(color=Type))+geom_point(aes(color=Type))+theme_classic()+ scale_color_grey()+ggtitle("Mean mean food disparity each round as a function of environmental hardship")+geom_errorbar(aes(ymin=income.disp-err.disp, ymax=income.disp+err.disp), width=.1, 
    position=position_dodge(0.05))
p2
