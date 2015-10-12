##This is an example script.
##Author: Ian Breckheimer
##Updated: 10-1-2015

####Set Up Workspace####

##Installs required packages
#install.packages(c("dplyr"))

##Load packages
library(dplyr)

##Load data.
gapminder <- read.csv("./data/gapminder.csv")

####Explore Data####

##Returns information about the data.
str(gapminder)

##Creates a subset of the data and a new variable.
canada <- filter(gapminder,country=="Canada")
canada <- mutate(canada,gdp=(gdpPercap*canada$pop)/1e10)

##Plots it
plot(x=canada$year,y=canada$gdp,type = "p",
     xlab="Year",
     ylab="Gross Domestic Product (billions,USD)",
     main="Canada")

####Analysis#####
model <- lm(gdp~year,data=canada)
summary(model)

####Make Figures#####
pdf("./plots/Fig1_Canada_GDP.pdf",width=5,height=5)
plot(x=canada$year,y=canada$gdp,type = "p",
     xlab="Year",
     ylab="Gross Domestic Product (billions,USD)",
     main="Canada")
abline(model,lty=2)
dev.off()


