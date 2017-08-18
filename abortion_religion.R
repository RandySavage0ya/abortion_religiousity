getwd()
setwd("C:/Users/rodne/Desktop/Sample R Data/abortion_religion/")
rm(abort_rel)
abort_rel<-read.csv("abortion_religion.csv")
getwd()

colnames(abort_rel)<-c("States", "Num.Abortions","Rate.Abortions", "Very.Religious")
colnames(abort_rel)

str(abort_rel)

library(ggplot2)
library(tidyverse)

ggplot(abort_rel, aes(Rate.Abortions, Very.Religious))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE, color='Red')+
  geom_text(check_overlap = TRUE,
            aes(label=States))+
  scale_y_continuous(position = "right")+
  labs(x= "Rate of Abortions",
       y= "Percentage Pop Very Religious",
       title = "Rate of Abortions and Importance of Religion by State, 2013",
       subtitle = "Rate of abortions per 1,000 women age 15-44 by Percentage of adults 18 and older that are very religious")+
  theme_bw()

#---------OR-----------#


ggplot(abort_rel, aes(Rate.Abortions, Very.Religious))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE, color='Red')+
  geom_text(data=subset(abort_rel,Very.Religious>=0.49 | Very.Religious<=0.34),
            check_overlap = TRUE,
            aes(label=States))+
  scale_y_continuous(position = "right")+
  labs(x= "Rate of Abortions",
       y= "Percentage Pop Very Religious",
       title = "Rate of Abortions and Importance of Religion by State, 2013",
       subtitle = "Rate of abortions per 1,000 women age 15-44 by Percentage of adults 18 and older that are very religious")+
  theme_bw()
