install.packages("neuralnet")
library(neuralnet)

df <- read.csv("C:\\Users\\Hp\\Downloads\\diabetes.csv")
df

install.packages("caret")
library(caret)

sample <- sample(c(TRUE,FALSE),nrow(df),replace = TRUE, prob = c(0.05,0.95))
train <- df[sample,]
test  <- df[!sample,]

neural = neuralnet(Outcome~ .,train,hidden = c(2,1),linear.output = FALSE)
plot(neural)
neural$result.matrix
#tweaking the train test data split gave an error of 4.2% after reducing the train size to reduce overfitting?
#no of iterations brought down to 67

testing <- predict(neural,test)
print(testing)

