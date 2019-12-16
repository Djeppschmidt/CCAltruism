# Community Cohesion, Resilience and Climate Change

library(dplyr)


altruist.data<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Miser-Climate_Ramp-table.csv")
miser.data<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_altruist-Climate_Ramp-table.csv")


# scarcer data on the updated model because of runtime limitations:
altruist20<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Altruist20_climate_ramp-table.csv")
#altruist18<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_18Altruist_climate_ramp_table.csv")
altruist16<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Altruist16_climate_ramp-table.csv")
#altruist14<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_14Altruist_climate_ramp_table.csv")
#altruist12<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_12Altruist_climate_ramp_table.csv")
altruist10<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Altruist10_climate_ramp-table.csv")
#altruist08<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_8Altruist_climate_ramp_table.csv")
#altruist06<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_6Altruist_climate_ramp_table.csv")
altruist04<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Altruist4_climate_ramp-table.csv")
#altruist02<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_2Altruist_climate_ramp_table.csv")
altruist00<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Altruist0_climate_ramp-table.csv")

library(stats)
library(plotrix)

altruist20.dat<-altruist20 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures), "I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#altruist18.dat<-altruist18 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

altruist16.dat<-altruist16 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#altruist14.dat<-altruist14 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#altruist12.dat<-altruist12 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

altruist10.dat<-altruist10 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#altruist08.dat<-altruist08 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#altruist06.dat<-altruist06 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

altruist04.dat<-altruist04 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#altruist02.dat<-altruist02 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

altruist00.dat<-altruist00 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures),"I.disp"=mean(max..Harvest..of..turtle.set.altruists.misers....min..Harvest..of..turtle.set.altruists.misers.)) %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

#all<-bind_rows(altruist20.dat,altruist18.dat,altruist16.dat,altruist14.dat,altruist12.dat,altruist10.dat,altruist08.dat,altruist06.dat,altruist04.dat,altruist02.dat,altruist00.dat)
all<-bind_rows(altruist20.dat,altruist16.dat,altruist10.dat,altruist04.dat,altruist00.dat)
all$Alt.number<-as.factor(all$Alt.number)
#all.2<-all[all$Alt.number==20|all$Alt.number==16|all$Alt.number==8|all$Alt.number==0,]

all.2<-all[all$Hardship>0.7,]

# Failures plot
ggplot(data=all, aes(x=Hardship, y=Failures, colour=Alt.number))+
    #geom_bar(stat="identity", position=position_dodge())+
    theme_minimal()+
    geom_line()+
    geom_point()+
    geom_errorbar(aes(ymin=Failures-Failures.se, ymax=Failures+Failures.se), width=0.1)+
    scale_color_viridis_d()

# Hunger plot
ggplot(data=all, aes(x=Hardship, y=hungryN, colour=Alt.number))+
    #geom_bar(stat="identity", position=position_dodge())+
    theme_minimal()+
    geom_line()+
    geom_point()+
    geom_errorbar(aes(ymin=hungryN-hungryN.se, ymax=hungryN+hungryN.se),  width=0.1)+
    scale_color_viridis_d()

# Risk plot
ggplot(data=all, aes(x=Hardship, y=Risk, colour=Alt.number))+
    #geom_bar(stat="identity", position=position_dodge())+
    theme_minimal()+
    geom_line()+
    geom_point()+
    geom_errorbar(aes(ymin=Risk-Risk.se, ymax=Risk+Risk.se), width=0.1)+
    scale_color_viridis_d()

#disparity plot
#ggplot(data=all, aes(x=Hardship, y=Disparity, group=Alt.number, fill=Alt.number))+
ggplot(data=all, aes(x=Hardship, y=Disparity, colour=Alt.number))+
    #geom_bar(stat="identity", position=position_dodge())+
    theme_minimal()+
    geom_line()+
    geom_point()+
    geom_errorbar(aes(ymin=Disparity-disp.se, ymax=Disparity+disp.se), width=0.1)+
    scale_color_viridis_d()


sharing_advantange<-data.frame("Hardship"=c(all$Hardship[all$Alt.number==20]), "Risk"=c(all$Risk[all$Alt.number==0]-all$Risk[all$Alt.number==20]), "Hunger"=c(all$hungryN[all$Alt.number==0]-all$hungryN[all$Alt.number==20]), "Failures"=c(all$Failures[all$Alt.number==0]-all$Failures[all$Alt.number==20]))
    
s.advantage<-data.frame("Metric"=c(rep("Risk", 15), rep("Hunger", 15), rep("Failures", 15)), "Hardship"=c(rep(sharing_advantange$Hardship, 3)),"Value"=c(sharing_advantange$Risk/20, sharing_advantange$Hunger/20, sharing_advantange$Failures/200))

# Altruism Advantage Index Plot    
ggplot(data=s.advantage, aes(x=Hardship, y=Value, group=Metric))+
    geom_line(aes(color=Metric))+
    geom_point(aes(color=Metric))+
    theme_classic()+
    geom_hline(mapping=NULL,yintercept=0, linetype="dashed", color="black")+
    scale_color_viridis_d()

# AOV ####

altruist20.aov<-altruist20 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#altruist18.aov<-altruist18 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

altruist16.aov<-altruist16 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#altruist14.aov<-altruist14 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#altruist12.aov<-altruist12 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

altruist10.aov<-altruist10 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#altruist08.aov<-altruist08 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#altruist06.aov<-altruist06 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

altruist04.aov<-altruist04 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#altruist02.aov<-altruist02 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

altruist00.aov<-altruist00 %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures))

#all.aov<-bind_rows(altruist20.aov,altruist18.aov,altruist16.aov,altruist14.aov,altruist12.aov,altruist10.aov,altruist08.aov,altruist06.aov,altruist04.aov,altruist02.aov,altruist00.aov)
all.aov<-bind_rows(altruist20.aov,altruist16.aov,altruist10.aov,altruist04.aov,altruist00.aov)

#all.aov2<-all.aov[all.aov$Alt.number==20|all.aov$Alt.number==16|all.aov$Alt.number==8|all.aov$Alt.number==0,]

all.aov.H1<-all.aov[all.aov$Hardship==0.1,]
all.aov.H2<-all.aov[all.aov$Hardship==0.3,]
all.aov.H3<-all.aov[all.aov$Hardship==0.5,]
all.aov.H4<-all.aov[all.aov$Hardship==0.7,]
all.aov.H5<-all.aov[all.aov$Hardship==0.9,]
all.aov.H6<-all.aov[all.aov$Hardship==1.1,]
all.aov.H7<-all.aov[all.aov$Hardship==1.3,]
all.aov.H8<-all.aov[all.aov$Hardship==1.5,]
all.aov.H9<-all.aov[all.aov$Hardship==1.7,]
all.aov.H10<-all.aov[all.aov$Hardship==1.9,]
all.aov.H11<-all.aov[all.aov$Hardship==2.1,]
all.aov.H12<-all.aov[all.aov$Hardship==2.3,]
all.aov.H13<-all.aov[all.aov$Hardship==2.5,]
all.aov.H14<-all.aov[all.aov$Hardship==2.7,]
all.aov.H15<-all.aov[all.aov$Hardship==2.9,]

# failures stats ####
summary(aov(all.aov.H1$Failures~as.factor(all.aov.H1$Alt.number)))
TukeyHSD(aov(all.aov.H1$Failures~as.factor(all.aov.H1$Alt.number)))

summary(aov(all.aov.H2$Failures~as.factor(all.aov.H2$Alt.number)))
TukeyHSD(aov(all.aov.H2$Failures~as.factor(all.aov.H2$Alt.number)))

summary(aov(all.aov.H3$Failures~as.factor(all.aov.H3$Alt.number)))
TukeyHSD(aov(all.aov.H3$Failures~as.factor(all.aov.H3$Alt.number)))

summary(aov(all.aov.H4$Failures~as.factor(all.aov.H4$Alt.number)))
TukeyHSD(aov(all.aov.H4$Failures~as.factor(all.aov.H4$Alt.number)))

summary(aov(all.aov.H5$Failures~as.factor(all.aov.H5$Alt.number)))
TukeyHSD(aov(all.aov.H5$Failures~as.factor(all.aov.H5$Alt.number)))

summary(aov(all.aov.H6$Failures~as.factor(all.aov.H6$Alt.number)))
TukeyHSD(aov(all.aov.H6$Failures~as.factor(all.aov.H6$Alt.number)))

summary(aov(all.aov.H7$Failures~as.factor(all.aov.H7$Alt.number)))
TukeyHSD(aov(all.aov.H7$Failures~as.factor(all.aov.H7$Alt.number)))

summary(aov(all.aov.H8$Failures~as.factor(all.aov.H8$Alt.number)))
TukeyHSD(aov(all.aov.H8$Failures~as.factor(all.aov.H8$Alt.number)))

summary(aov(all.aov.H9$Failures~as.factor(all.aov.H9$Alt.number)))
TukeyHSD(aov(all.aov.H9$Failures~as.factor(all.aov.H9$Alt.number)))

summary(aov(all.aov.H10$Failures~as.factor(all.aov.H10$Alt.number)))
TukeyHSD(aov(all.aov.H10$Failures~as.factor(all.aov.H10$Alt.number)))

summary(aov(all.aov.H11$Failures~as.factor(all.aov.H11$Alt.number)))
TukeyHSD(aov(all.aov.H11$Failures~as.factor(all.aov.H11$Alt.number)))

summary(aov(all.aov.H12$Failures~as.factor(all.aov.H12$Alt.number)))
TukeyHSD(aov(all.aov.H12$Failures~as.factor(all.aov.H12$Alt.number)))

summary(aov(all.aov.H13$Failures~as.factor(all.aov.H13$Alt.number)))
TukeyHSD(aov(all.aov.H13$Failures~as.factor(all.aov.H13$Alt.number)))

summary(aov(all.aov.H14$Failures~as.factor(all.aov.H14$Alt.number)))
TukeyHSD(aov(all.aov.H14$Failures~as.factor(all.aov.H14$Alt.number)))

summary(aov(all.aov.H15$Failures~as.factor(all.aov.H15$Alt.number)))
TukeyHSD(aov(all.aov.H15$Failures~as.factor(all.aov.H15$Alt.number)))
#summary(aov(all.aov.H16$Failures~as.factor(all.aov.H1$Alt.number)))

# Hunger ####
summary(aov(all.aov.H1$hungryN~as.factor(all.aov.H1$Alt.number)))
TukeyHSD(aov(all.aov.H1$hungryN~as.factor(all.aov.H1$Alt.number)))

summary(aov(all.aov.H2$hungryN~as.factor(all.aov.H2$Alt.number)))
TukeyHSD(aov(all.aov.H2$hungryN~as.factor(all.aov.H2$Alt.number)))

summary(aov(all.aov.H3$hungryN~as.factor(all.aov.H3$Alt.number)))
TukeyHSD(aov(all.aov.H3$hungryN~as.factor(all.aov.H3$Alt.number)))

summary(aov(all.aov.H4$hungryN~as.factor(all.aov.H4$Alt.number)))
TukeyHSD(aov(all.aov.H4$hungryN~as.factor(all.aov.H4$Alt.number)))

summary(aov(all.aov.H5$hungryN~as.factor(all.aov.H5$Alt.number)))
TukeyHSD(aov(all.aov.H5$hungryN~as.factor(all.aov.H5$Alt.number)))

summary(aov(all.aov.H6$hungryN~as.factor(all.aov.H6$Alt.number)))
TukeyHSD(aov(all.aov.H6$hungryN~as.factor(all.aov.H6$Alt.number)))

summary(aov(all.aov.H7$hungryN~as.factor(all.aov.H7$Alt.number)))
TukeyHSD(aov(all.aov.H7$hungryN~as.factor(all.aov.H7$Alt.number)))

summary(aov(all.aov.H8$hungryN~as.factor(all.aov.H8$Alt.number)))
TukeyHSD(aov(all.aov.H8$hungryN~as.factor(all.aov.H8$Alt.number)))

summary(aov(all.aov.H9$hungryN~as.factor(all.aov.H9$Alt.number)))
TukeyHSD(aov(all.aov.H9$hungryN~as.factor(all.aov.H9$Alt.number)))

summary(aov(all.aov.H10$hungryN~as.factor(all.aov.H10$Alt.number)))
TukeyHSD(aov(all.aov.H10$hungryN~as.factor(all.aov.H10$Alt.number)))

summary(aov(all.aov.H11$hungryN~as.factor(all.aov.H11$Alt.number)))
TukeyHSD(aov(all.aov.H11$hungryN~as.factor(all.aov.H11$Alt.number)))

summary(aov(all.aov.H12$hungryN~as.factor(all.aov.H12$Alt.number)))
TukeyHSD(aov(all.aov.H12$hungryN~as.factor(all.aov.H12$Alt.number)))

summary(aov(all.aov.H13$hungryN~as.factor(all.aov.H13$Alt.number)))
TukeyHSD(aov(all.aov.H13$hungryN~as.factor(all.aov.H13$Alt.number)))

summary(aov(all.aov.H14$hungryN~as.factor(all.aov.H14$Alt.number)))
TukeyHSD(aov(all.aov.H14$hungryN~as.factor(all.aov.H14$Alt.number)))

summary(aov(all.aov.H15$hungryN~as.factor(all.aov.H5$Alt.number)))
TukeyHSD(aov(all.aov.H15$hungryN~as.factor(all.aov.H15$Alt.number)))

# Risk AOV
summary(aov(all.aov.H1$Risk~as.factor(all.aov.H1$Alt.number)))
TukeyHSD(aov(all.aov.H1$Risk~as.factor(all.aov.H1$Alt.number)))

summary(aov(all.aov.H2$Risk~as.factor(all.aov.H2$Alt.number)))
TukeyHSD(aov(all.aov.H2$Risk~as.factor(all.aov.H2$Alt.number)))

summary(aov(all.aov.H3$Risk~as.factor(all.aov.H3$Alt.number)))
TukeyHSD(aov(all.aov.H3$Risk~as.factor(all.aov.H3$Alt.number)))

summary(aov(all.aov.H4$Risk~as.factor(all.aov.H4$Alt.number)))
TukeyHSD(aov(all.aov.H4$Risk~as.factor(all.aov.H4$Alt.number)))

summary(aov(all.aov.H5$Risk~as.factor(all.aov.H5$Alt.number)))
TukeyHSD(aov(all.aov.H5$Risk~as.factor(all.aov.H5$Alt.number)))

summary(aov(all.aov.H6$Risk~as.factor(all.aov.H6$Alt.number)))
TukeyHSD(aov(all.aov.H6$Risk~as.factor(all.aov.H6$Alt.number)))

summary(aov(all.aov.H7$Risk~as.factor(all.aov.H7$Alt.number)))
TukeyHSD(aov(all.aov.H7$Risk~as.factor(all.aov.H7$Alt.number)))

summary(aov(all.aov.H8$Risk~as.factor(all.aov.H8$Alt.number)))
TukeyHSD(aov(all.aov.H8$Risk~as.factor(all.aov.H8$Alt.number)))

summary(aov(all.aov.H9$Risk~as.factor(all.aov.H9$Alt.number)))
TukeyHSD(aov(all.aov.H9$Risk~as.factor(all.aov.H9$Alt.number)))

summary(aov(all.aov.H10$Risk~as.factor(all.aov.H10$Alt.number)))
TukeyHSD(aov(all.aov.H10$Risk~as.factor(all.aov.H10$Alt.number)))

summary(aov(all.aov.H11$Risk~as.factor(all.aov.H11$Alt.number)))
TukeyHSD(aov(all.aov.H11$Risk~as.factor(all.aov.H11$Alt.number)))

summary(aov(all.aov.H12$Risk~as.factor(all.aov.H12$Alt.number)))
TukeyHSD(aov(all.aov.H12$Risk~as.factor(all.aov.H12$Alt.number)))

summary(aov(all.aov.H13$Risk~as.factor(all.aov.H13$Alt.number)))
TukeyHSD(aov(all.aov.H13$Risk~as.factor(all.aov.H13$Alt.number)))

summary(aov(all.aov.H14$Risk~as.factor(all.aov.H14$Alt.number)))
TukeyHSD(aov(all.aov.H14$Risk~as.factor(all.aov.H14$Alt.number)))

summary(aov(all.aov.H15$Risk~as.factor(all.aov.H5$Alt.number)))
TukeyHSD(aov(all.aov.H15$Risk~as.factor(all.aov.H15$Alt.number)))

#summary(aov(all.aov.H16$Failures~as.factor(all.aov.H1$Alt.number)))

AMC.data2<-AMC.data %>% group_by(X.run.number.) %>% summarize("Hardship"=mean(hardship), "Alt.number"=mean(altruist.number), "mis.number"=mean(miser.number), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures), "altruists"=mean(altruist.number)/(mean(altruist.number)+mean(miser.number))) %>% group_by(Perc.alt) %>% group_by(Hardship)  %>% summarize("Hardship"=mean(Hardship), "APerc.alt"=mean(Perc.alt), "Risk"=mean(Risk), "Failures"=mean(Failures), "HungryN"=mean(HungryN))

miser.data2<-miser.data %>% group_by(X.run.number.) %>% summarize("max.food"=mean(max..Harvest..of.misers), "min.food"=mean(min..Harvest..of.misers), "failures"=sum(count..misers..with..Harvest....0.), "hardship"=mean(hardship)) %>% group_by(hardship)


ENV.Hardship<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherenceEnvRamp-Hardship-table.csv")

ENV.resource<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherenceEnvRamp-Resource-table.csv")

dist1<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Resource-dist1-table.csv")
dist1<-unlist(dist1)
#dist1<-as.data.frame(dist1)
#dist1<-data.frame("Dist"=c(rep("dist1"), 1089000), "Value"=dist1)

dist2<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Resource-dist2-table.csv")
dist2<-unlist(dist2)
#dist2<-as.data.frame(dist2)
#dist2<-data.frame("Dist"=c(rep("dist2"), 1089000), "Value"=dist2)

dist3<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Resource-dist3-table.csv")
dist3<-unlist(dist3)
#dist3<-as.data.frame(dist3)
#dist3<-data.frame("Dist"=c(rep("dist3"), 1089000), "Value"=dist3)

dist4<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Resource-dist4-table.csv")
dist4<-unlist(dist4)
#dist4<-as.data.frame(dist4)
#dist4<-data.frame("Dist"=c(rep("dist4"), 1089000), "Value"=dist4)

dd<-data.frame("Dist"=c(rep("dist4", 1089000),rep("dist3", 1089000),rep("dist2", 1089000), rep("dist1", 1089000)), "Value"=c(dist4,dist3,dist2,dist1))
#dd[dd==0]<-NA

library(dplyr)
library(ggplot2)

altruist.summary<-altruist.data %>% group_by(X.run.number.) %>% summarize("failures"=mean(count.misers.with..Harvest...0.), "hardship"=mean(hardship)) %>% group_by(hardship) %>% summarize("err.fail"=std.error(failures), "failures"=mean(failures))


altruist.summary$Type<- c(rep("Altruist", 8))

miser.summary<-miser.data %>% group_by(X.run.number.) %>% summarize("failures"=mean(count.misers.with..Harvest...0.), "hardship"=mean(hardship)) %>% group_by(hardship) %>% summarize("err.fail"=std.error(failures), "failures"=mean(failures))

ENVHardship.Summary<- ENV.Hardship %>% group_by(X.run.number.) %>% summarize("t.closures"=max(total.closures), "Mean.resource"=mean(mean..resource..of.patches), "Max.Resource"=max(Max.Resource), "hardship"=mean(hardship)) %>% group_by(hardship) %>% summarize("closures"=mean(t.closures),"sd.closures"=sd(t.closures), "MeanR"=mean(Mean.resource), "st.MeanR"=sd(Mean.resource), "MaxR"=mean(Max.Resource))

ENVResource.Summary<-ENV.resource %>% group_by(X.run.number.) %>% summarize("MeanR"=mean(mean..resource..of.patches), "hardship"=as.factor(mean(hardship)), "resource"=as.factor(mean(resource.abundance))) %>% group_by(factor=resource, hardship) %>% summarize("sd.MeanR"=sd(MeanR),"MeanR"=mean(MeanR))

miser.summary$Type<- c(rep("Miser", 8))
data<-rbind(altruist.summary, miser.summary)

ggplot(data, aes(x=hardship, y=failures, group=Type))+geom_line(aes(color=Type))+geom_point(aes(color=Type))+theme_classic()+
    scale_color_grey()+
    #ggtitle("Mean number of agents without food each tick")+
    geom_errorbar(aes(ymin=failures-err.fail, ymax=failures+err.fail), width=.1, position=position_dodge(0.05))+
   scale_color_manual("Type", values=c("#FDE725FF", "#440154FF"))+labs(x="Hardship", y="N Without Food")
    scale_color_viridis_d()
#p

#p2<-ggplot(data, aes(x=hardship, y=income.disp, group=Type))+geom_line(aes(color=Type))+geom_point(aes(color=Type))+theme_classic()+ggtitle("Mean mean food disparity each round as a function of environmental hardship")+geom_errorbar(aes(ymin=income.disp-err.disp, ymax=income.disp+err.disp), width=.1, 
 #   position=position_dodge(0.05))+scale_color_manual("Type", values=c("#FDE725FF", "#440154FF"))
#p2

ggplot(ENVHardship.Summary, aes(x=hardship, y=closures/200))+geom_point()+theme_classic()+ ylab("Probability of closure")+ xlab("Environmental hardship")+geom_errorbar(aes(ymin=closures/200-sd.closures/200, ymax=closures/200+sd.closures/200), width=.1, 
    position=position_dodge(0.05))+scale_color_manual("Type", values=c("#FDE725FF", "#440154FF"))

ggplot(ENVHardship.Summary, aes(x=hardship, y=MeanR))+geom_point()+theme_classic()+ scale_color_grey()+ ylab("Mean resource")+ xlab("Environmental hardship")+geom_errorbar(aes(ymin=MeanR-st.MeanR, ymax=MeanR+st.MeanR), width=.1, 
    position=position_dodge(0.05))

ggplot(ENVResource.Summary, aes(x=hardship, y=MeanR))+geom_point()+theme_classic()+ scale_color_grey()+ ylab("Mean resource")+ xlab("Environmental hardship")+geom_errorbar(aes(ymin=MeanR-st.MeanR, ymax=MeanR+st.MeanR), width=.1, 
    position=position_dodge(0.05))


ggplot(dd, aes(x=Value, color=Dist))+geom_density(bw=1)+theme_minimal()+scale_color_viridis_d()+labs(x="Resource Level", y="Probability")+scale_fill_discrete(name="Level", labels=c("1", "2", "3", "4"))


# e-Knowledge level ####
sharing<-read.csv("~/Documents/GitHub/CCAltruism/CommunityCoherence_Altruist20_sharing_ramp-table.csv")

sharing.dat<-sharing %>% group_by(X.run.number.) %>% summarize("Hardship"=as.factor(mean(hardship)), "hungryN"=mean(HungryN),"Risk"=mean(SRisk), "Failures"=max(Failures), "Shared"=as.factor(mean(e.knowledge)))

# %>% group_by(Hardship) %>% summarize("Alt.number"=mean(Alt.number),"hungryN.se"=std.error(hungryN), "hungryN"=mean(hungryN), "Risk.se"=std.error(Risk), "Risk"=mean(Risk),"Failures.se"=std.error(Failures), "Failures"=mean(Failures), "disp.se"=std.error(I.disp), "Disparity"=mean(I.disp))

# Failures
ggplot(data=sharing.dat, aes(x=Hardship, y=Failures, fill=Shared))+
    #geom_bar(stat="identity", position=position_dodge())+
    geom_boxplot(position=position_dodge(1))+theme_minimal()+
    #geom_errorbar(aes(ymin=Failures-Failures.se, ymax=Failures+Failures.se), width=0.1)+
    scale_fill_viridis_d()
# Risk
ggplot(data=sharing.dat, aes(x=Hardship, y=Risk, fill=Shared))+
    #geom_bar(stat="identity", position=position_dodge())+
    geom_boxplot(position=position_dodge(1))+theme_minimal()+
    #geom_errorbar(aes(ymin=Failures-Failures.se, ymax=Failures+Failures.se), width=0.1)+
    scale_color_viridis_d(easthetics="fill")
# HungryN
ggplot(data=sharing.dat, aes(x=Hardship, y=hungryN, fill=Shared))+
    #geom_bar(stat="identity", position=position_dodge())+
    geom_boxplot(position=position_dodge(1))+theme_minimal()+
    #geom_errorbar(aes(ymin=Failures-Failures.se, ymax=Failures+Failures.se), width=0.1)+
    scale_color_viridis_d()



summary(aov(sharing.dat$Failures~sharing.dat$Shared+sharing.dat$Hardship))
summary(aov(sharing.dat$Risk~sharing.dat$Shared+sharing.dat$Hardship))
summary(aov(sharing.dat$hungryN~sharing.dat$Shared+sharing.dat$Hardship))

TukeyHSD(aov(all.aov.H5$hungryN~as.factor(all.aov.H5$Alt.number)))
