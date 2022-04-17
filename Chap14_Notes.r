### Chap 14 Visualization
data(obama_vs_mccain, package = "learningr")

# 4 散点图
obama_vs_mccain_nona <- obama_vs_mccain[!is.na(obama_vs_mccain$Turnour), ]

with(obama_vs_mccain, plot(Income, Turnout))

with(obama_vs_mccain, plot(Income, Turnout, col = "violet", pch = 20))

# 4.3 ggplot
library(tidyverse)

ggplot(obama_vs_mccain, aes(Income, Turnout)) +
    geom_point()

ggplot(obama_vs_mccain, aes(Income, Turnout)) + 
    geom_point(color = "violet", shape = 20)

ggplot(obama_vs_mccain, aes(Income, Turnout)) + 
    geom_point() + 
    scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) + 
    scale_y_log10(breaks = seq(50, 75, 5))

# Line figure
data(crab_tag, package = "learningr")
ggplot(crab_tag$daylog, aes(Date, -Min.Depth)) + 
    geom_line()

ggplot(crab_tag$daylog, aes(Date)) + 
    geom_line(aes(y = -Max.Depth)) +
    geom_line(aes(y = -Min.Depth))

ggplot(crab_tag$daylog, aes(Date, ymin = -Min.Depth, ymax = -Max.Depth)) +
    geom_ribbon(color = "black", fill = "white")

# Histogram figure
ggplot(obama_vs_mccain, aes(Obama)) +
    geom_histogram(binwidth = 5)

# 条形图
data(religion_long, package = "learningr")
ggplot(religion_long, aes(State, value, fill = varibale)) +
    geom_bar(stat = "identity") + 
    coord_flip()

