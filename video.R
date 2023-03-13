library(tidyverse)
library(hms)
library(dplyr)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)

CM_CMEC_Values_1 <- read_excel("~/Desktop/CM_CMEC_Values_1.xlsx")

# Scale and plot pixel intensity changes
video <- CM_CMEC_Values_1
video[,-1] <- scale(video[,-1], center = TRUE, scale = TRUE)
video <- as.data.frame(video)
df.m <- melt(video, id.vars = "frame")
df.m$sec <- df.m$frame / 30
head(df.m)

# Plot the melted data using ggplot
ggplot(df.m, aes(x = sec, y = value, )) +
  geom_point(aes(x=sec, y=value), size=1, shape=1, color = "gray40", alpha = 0.3) +
  stat_smooth(span = 0.1, se = F, colour="black",  size=0.5) +
  #geom_line(aes(x=sec, y=value), linewidth=0.25) +
  labs(x = "Time (seconds)", y = "Contractility") +
  theme_minimal() +
  facet_wrap(~variable, ncol = 5)

