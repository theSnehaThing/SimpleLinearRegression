#datapreprocessing
#Importing the Dataset
dataset = read.csv('Salary_Data.csv')
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
train_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting
regressor = lm(formula = Salary ~ YearsExperience, data = train_set)

#Predicting
y_pred = predict(regressor, newdata = test_set)

#Visualize
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = train_set$YearsExperience, y = train_set$Salary),
             colour = 'red') +
  geom_line(aes(x=train_set$YearsExperience, y=predict(regressor, newdata = train_set)),
            colour = 'blue') +
  ggtitle('Salary Vs Experience(Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x=train_set$YearsExperience, y=predict(regressor, newdata = train_set)),
            colour = 'blue') +
  ggtitle('Salary Vs Experience(Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

