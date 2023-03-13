library(tidyverse)
library(hms)
library(dplyr)
library(lubridate)
library(ggplot2)
library(scales)

baseline_ct <- read_csv("~/Desktop/Buck/cardiac_organoid/baseline_ct.csv")

baseline_ct$C2_32 <- scale(baseline_ct$C2_32, center = TRUE, scale = TRUE)

ggplot(baseline_ct, aes(x = sec, y = C2_32, na.rm=TRUE)) +
  geom_line() +
  labs(x = "Time (seconds)", y = "Contractility")+
  theme_minimal() +
  ylim(c(-2,2))

