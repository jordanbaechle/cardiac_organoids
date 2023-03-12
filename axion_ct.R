library(tidyverse)
library(hms)
library(dplyr)
library(lubridate)
library(ggplot2)
library(scales)

ggplot(baseline_ct, aes(x = sec, y = C2_32, na.rm=TRUE, color = )) +
  geom_line() +
  labs(x = "Time (seconds)", y = "Contractility")+
  theme_minimal() +
  ylim(c(-2,2))
            