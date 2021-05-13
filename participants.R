library(tidyverse)

setwd("C:/Users/hauer/Box/EPSCoR_T1_18-23/Communications/Working Group Websites/UCFR/Topic Discussion Meetings")

part <- read_csv('participants.csv')

part$month <- factor(part$month, levels = unique(part$month))

part <- part %>% 
  mutate(month_num = c(1,2,3,4,5))

mean_part <- round(mean(part$participants), 0)

part %>% 
  ggplot(aes()) +
  geom_point(aes(x=month, y=participants), 
             col="blue", size=3, shape = 24, fill="blue") +
  geom_line(aes(x=month_num, y=participants), col="blue") +
  geom_hline(yintercept = mean_part, linetype="dashed", color="red") +
  annotate(geom = "text", x=2.5, y=55, label="Avg. Part. = 65", color="red", size=10) +
  labs(y="Participants", x="Month", 
       title = "UCFWG Monthly Meeting Participants")+
  theme_classic() +
  scale_y_continuous(limits = c(0,85))


