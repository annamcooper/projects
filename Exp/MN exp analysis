library(aiGraphs)
library(aiEstimation)
library(aiHelper)
library(knitr)
library(data.table)
setwd("C:/Users/acooper.CWA-UNION/Desktop")

df <- read.csv('mn_gotv_data1.csv', header = T, stringsAsFactors = T)

df$turnout_bin <- bin(df$cat_vote_prop_2017, 4)


z1 <- top(df = df, outcome = 'voted_2017', treat = 'final_assign', model = 'binomial')

subgroup(df, outcome = 'voted_2017', treat = 'final_assign', subgroup = 'turnout_bin', model = 'binomial')

cross_plot(data=df, input = 'final_assign', target = 'voted_2017')

categ_analysis(data = df, input = 'final_assign', target = 'voted_2017')


marg

plot_data <- fmt_ai_toplines(z1)

plot_data <- clean_graph(
  z1$margins[[1]],
  estimate = 'Margin',
  se = 'Standard.Error',
  dof = z1$model$df.residual)

plot_data$Level <- factor(plot_data$Level,
                          levels = c("control", "social pressure", "voting rights"),
                          ordered = T)
