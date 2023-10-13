#creating a dataset. c stands for concatenate or combine
x = c(4, 8, 23, 2, 16, 7)

#built-in functions for calculating simple descriptive statistics from a vector of data
mean(x)  #arithmetic mean
median(x) #middle value
length(x) #number of elements in a vector or trial
range(x) #Largest and smallest value
sd(x) #standard deviation
var(x) #variance

#To get help with any function, use the help() function or the ? operator, along with the name of the function
help(max)
?max

#to explore data
summary(x)

'''
Creating and using dataframes.
Creating a dataframe from a collection of vectors.
<- is the assignment operator in r and can be used interchangeably with =

'''
pulse <-c(120, 134, 152)
exercise_level <-c("light", "intense", "intense")
time_in_mins<-c(30,20,20)
exercise_dataframe<-data.frame(pulse, exercise_level, time_in_mins)
print(exercise_dataframe)

# To get the summary statistics of the created dataframe
summary(exercise_dataframe)

'''
There are three main data types in a Data Frame – numeric, character and factor. 
Factors are variables which take in a limited number of different values  
in other words, we use afactor in R to represent categorical variables.
So for example, in our Data Frame, ‘exercise_level’ is a categorical variable
which can take two values (light or intense) we canconvert this column 
into a factor.
the $ symbol is used to extract or access a specific column (variable) within a data frame.
When you have a data frame and you want to work with a particular column, you can use the $ symbol 
followed by the name of the column to access the data within that column
'''

exercise_dataframe$exercise_level <-
  as.factor(exercise_dataframe$exercise_level)

#Rerun the summary
summary(exercise_dataframe)

'''
Another way to access specific columns,rows and values 
in a Data Frame is by using the row or column index.

'''

#returning the value in the first row, third column 
exercise_dataframe[1,3]

#return all rows in the first column
exercise_dataframe[,1]

#Also return all rows in the first column
exercise_dataframe$time_in_mins

# to select all columns in a specific row
exercise_dataframe[1,]

'''
To  select multiple rows and columns. 
returns the second and third columns of the first and second rows
'''
exercise_dataframe[1:2,2:3]

'''
We also use negative referencing
which drops the column we are referencing

'''
exercise_dataframe[,-3]

'''
We can also use logical subsettling to return a subset of a Data Frame. 
For example, say wewant to select only those rows with a pulse of over 130.
'''
exercise_dataframe[exercise_dataframe$pulse > 130,]

#Returns a Boolean array of TRUE or FALSE based on which rows meet the condition.
exercise_dataframe$pulse > 130

#For example, say we have a vector of 0’s and 1’s which represents who completed the training.We only want to select those that did (represented by the 1).This returns the first and third rows as these correspond to the 1 values in the vector 
completed_training<-c(1, 0, 1)
exercise_dataframe[completed_training==1,]

# to list the data sets available in available packages
data()

#Explore cars dataset
summary(cars)

#graphical check of cars data
plot(cars)

#to produce a histogram
hist(cars$speed)

hist(cars$dist)

# Kernel density plots are another effective way to view the distribution of a variable. Createthe plot using plot(density(x)) where x is a numeric vector
plot(density(cars$speed))

plot(density(cars$dist))

#import the first data file called "Thaitourism1.csv" and create a dataframe called“Thai_tourist”
Thai_tourist <-read.csv("Thaitourism1.csv", header=TRUE)

# Inspect the dataset 
names(Thai_tourist) #to get the column names
head(Thai_tourist) #displays the first few rows of the data frame
tail(Thai_tourist) #displays the last few rows of the data frame.
str(Thai_tourist)  #structure of the data frame. It displays the data type and the first few values of each column
summary(Thai_tourist)  #provides summary statistics for each column in the data frame.

#import the second data file called "Thaitourism2.csv" and create a dataframe called“Thai_tourist_full
Thai_tourist_full <- read.csv("Thaitourism2.csv", header=TRUE)

# Inspect the dataset
names(Thai_tourist_full)
head(Thai_tourist_full)
tail(Thai_tourist_full)
str(Thai_tourist_full)
summary(Thai_tourist_full)


#Filter the Thai_tourist data frame and create a new data frame called Thai_2016 to containonly 2016 data
Thai_2016<-Thai_tourist[Thai_tourist$Year==2016,]

#view the new dataframe
Thai_2016

#Filter the Thai_tourist_full data frame and create a new data frame called Thai_UK to contain only UK tourists data.
Thai_UK<-Thai_tourist_full[Thai_tourist_full$nationality=="UnitedKingdom",]

#view the new data frame
Thai_UK

#Using the bar plot function
barplot(Thai_2016$Tourists_1000s)

#The names.arg option is used to set the category names. 
barplot(Thai_2016$Tourists_1000s,names.arg=Thai_2016$Region)

#to run bars horizontally then you set horiz to TRUE
barplot(Thai_2016$Tourists_1000s,names.arg=Thai_2016$Region,horiz=TRUE)

#To specify colour
barplot(Thai_2016$Tourists_1000s,names.arg=Thai_2016$Region,col=c("red", "blue"))

#the rainbow() function can be used to create a vector of n contiguous colours
barplot(Thai_2016$Tourists_1000s,names.arg=Thai_2016$Region,col=rainbow(8))

#using the hist function to get a histogram
hist(Thai_UK$tourists)                                                                 

#To control the number of categories into which the data is broken you use the breaks argument.
hist(Thai_UK$tourists,breaks=16)                                                                

# to create a a density histogram
hist(Thai_UK$tourists,freq=FALSE)

#to put text above each of the bars then you can pass a character vector in the labelsargument.
hist(Thai_UK$tourists, labels=TRUE)

#Axis labels for the x and y axes can be set using the xlab and ylab options.
hist(Thai_UK$tourists, xlab="No. of UK Tourists per month",col=rainbow(8))                                                                 


#below code crates a new dataframe called Thai_Europe to hold only data fromEurope Region.#subset() function return subsets of vectors, matrices or data frames whichmeet conditions. The subset( ) function is the easiest way to select variablesand observations from large dataset.#droplevels() function is used to drop unused levels from factors in a dataframe.
Thai_Europe <-droplevels(subset(Thai_tourist_full, region=="Europe"))                                                                 

#Plotting single numeric vector
boxplot(Thai_Europe$tourists, data=Thai_Europe)                                                                 

#Plotting boxplot with a formula
boxplot(tourists~nationality, data=Thai_Europe,col=rainbow(8))                                                                 

#t can be plotted sideways
boxplot(tourists~nationality, data=Thai_Europe,col=rainbow(8),horizontal=TRUE)

#specifying a subset of observations to be used for plotting
boxplot(tourists~nationality, data=Thai_Europe,col=rainbow(8),
        subset=nationality %in% c("France", "Russia", "Germany"))

#using the pie function
pie(Thai_2016$Tourists_1000s)

#create a pie chart with colored segments, and each segment will be labeled with the corresponding region from the "Region" column
pie(Thai_2016$Tourists_1000s,labels =Thai_2016$Region,col=rainbow(8))

#Add percentage to the labels
percent <-round(100*Thai_2016$Tourists_1000s/sum(Thai_2016$Tourists_1000s),1)
percent <-paste(Thai_2016$Region, "-",percent,"%") #add percentsto labels
#paste) function is simply concatenates the vector with space separator.
pie(Thai_2016$Tourists_1000s, labels = percent, col = rainbow(8))


install.packages("ggplot2")

#load libraries into R session
library(ggplot2)


#scatterplot with qplot() function
qplot(Region,Tourists_1000s,data=Thai_tourist)


qplot(Region,Tourists_1000s,data=Thai_tourist, color = Year)
qplot(Region,Tourists_1000s,data=Thai_tourist, color = Year, size = I(10))

#Boxplot with qplot() function
qplot(Region,Tourists_1000s,data=Thai_tourist, geom = "boxplot",fill=I("red"))

qplot(tourists,data=Thai_UK, geom = "histogram",fill=I("red"))
qplot(tourists,data=Thai_UK, geom = "density",fill=I("red"))




