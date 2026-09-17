library(readr)
install.packages("tidyverse")
install.packages("ggplot2")
bmi<-read.delim("//Users//aadyachaturvedi//Desktop//Data//BMI_PA.txt")
bmi_df<-data.frame(bmi)
bmi_df$sex<-factor(bmi_df$sex,
                levels = c(0,1),
                labels = c("female","male"))
bmi_df
library(ggplot2)
ggplot(bmi_df, aes(PA,BMI)) + geom_point() + labs(x= "Physical Activity", y="BMI") + geom_smooth(method = lm)
summary(bmi_df)
females<-subset(bmi_df,sex == "female")
males<-subset(bmi_df,sex == "male")
bmi_df.lm<-lm(BMI ~ PA, data = bmi_df)
summary(bmi_df.lm)
confint(bmi_df.lm)
ggplot(bmi_df, aes(sex,BMI)) + geom_point() 
ggplot(bmi_df, aes(sex,PA)) + geom_point()
