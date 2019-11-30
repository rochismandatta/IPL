getwd()
setwd("/Users/devottambhattacharya/Documents/IPL data/IPL Bowlers")
a <- read.csv("bowler_dump_2008.csv")
b <- read.csv("bowler_dump_2009.csv")
c <- read.csv("bowler_dump_2010.csv")
d <- read.csv("bowler_dump_2012.csv")
e <- read.csv("bowler_dump_2013.csv")
f <- read.csv("bowler_dump_2014.csv")
g <- read.csv("bowler_dump_2015.csv")
h <- read.csv("bowler_dump_2016.csv")
i <- read.csv("bowler_dump_2017.csv")
install.packages("forecast")

head(g)
head(a)

j <- rbind(a,b,c,d,e,f,g,h,i)
j
y <- 3
#j$points <- (j$W * 10) + (j$M * 4) + if(j$Econ < 4,3, else(j$Econ > 4 | j$Econ <5, 2, else(j$Econ>5 | j$Econ <6, 1,0)))
j$Econ <- double(j$Econ)
str(j$Econ)
j$points <- ifelse(j$Econ < 4,3,
       ifelse(j$Econ > 4 & j$Econ < 5 , 2, ifelse(j$Econ > 5 & j$Econ < 6,1,0)))
j$Econ <- as.numeric(j$Econ)
which(is.na(j$Econ))
j[!complete.cases(j),]
j <- j[!is.na(j$Econ),]
which(is.na(j))

j$points <- j$M*4 +j$W * 10+ifelse(j$Econ < 4,3,
                   ifelse(j$Econ > 4 & j$Econ < 5 , 2, ifelse(j$Econ > 5 & j$Econ < 6,1,ifelse(j$Econ>9 & j$Econ<10, -1, ifelse(j$Econ>10 & j$Econ<11, -2, ifelse(j$Econ>11, -3, 0)))))) + ifelse(j$W==4,4,ifelse(j$W==5,5,0))
#Functions for time series plotting
col_add <- function(Name, row){
  Name <- cbind(data.frame(seq(1,row,1)), Name)
  colnames(Name)[1] <- "seq"
  return(as.data.frame(Name))
}
plot_add <- function(Name){
  ggplot(data = Name, aes(x=seq, y= points)) + geom_point() + geom_line()+stat_smooth()
}

Predict <- function(Name){
  Point_forecasts <- HoltWinters(Name$points, beta = F, gamma = F)
  Point_forecasts
  Point_forecasts_value <- forecast(Point_forecasts, h=5)
  Point_forecasts_value
}

#Bumrah

Bumrah <- j[j$Bowling=="JJ Bumrah",]
hist(Bumrah$points)
Bumrah
Bumrah <- col_add(Bumrah,47)
plot_add(Bumrah)
Predict(Bumrah)

#SP Narine
Narine <-  j[j$Bowling=="SP Narine",]
Narine
hist(Narine$points)
summary(Narine$points)
sd(Narine$points)
par(mfrow=c(1,1))
Narine <- cbind(data.frame(seq(1,81,1)), Narine)
colnames(Narine)[1] <- "seq"
plot(Narine$seq.1..81..1.,Narine$points)
point_plot <- function(name){
  ggplot(data = name, aes(x=seq, y= points)) + geom_point() + geom_line()+ stat_smooth(method = "lm")
}
plot_add(Narine)
Predict(Narine)
#Rashid Khan
Rashid <-  j[j$Bowling=="Rashid Khan",]
hist(Rashid$points)
Predict(Rashid)


Rashid <- col_add(Rashid, 14)
Rashid
plot_add(Rashid)
#Rahman
Rahman<- j[j$Bowling=="Mustafizur Rahman",]
hist(Rahman$points)
Rahman <- col_add(Rahman,17)
plot_add(Rahman)

#Kumar
Kumar <- j[j$Bowling=="B Kumar",]
hist(Kumar$points)
Kumar <- col_add(Kumar, 86)
plot_add(Kumar)

#Mitchell McClenaghan

McClenaghan <- j[j$Bowling=="MJ McClenaghan",]
hist(McClenaghan$points)
McClenaghan <- col_add(McClenaghan,40)
plot_add(McClenaghan)
#Washington Sundar
Washington <- j[j$Bowling=="Washington Sundar",]
hist(Washington$points)
Washington <- col_add(Washington, 10)
plot_add(Washington)


#Billy Stanlake
Stanlake <- j[j$Bowling=="B Stanlake",]

#Mayank Markande
Markande <- j[j$Bowling=="M Markande",]

#YS Chahal
Chahal <- j[j$Bowling=="YS Chahal",]
Chahal <- col_add(Chahal,55)
plot_add(Chahal)

#Imran Tahir
Tahir <- j[j$Bowling=="Imran Tahir",]
Tahir <- col_add(Tahir, 32)
plot_add(Tahir)

#Mohammed Shami  
Shami <-  j[j$Bowling=="Mohammed Shami",]
Shami <- col_add(Shami, 31)
plot_add(Shami)

#Harbhajan Singh
Harbhajan <- j[j$Bowling=="Harbhajan Singh",]
Harbhajan <- col_add(Harbhajan, 111)
plot_add(Harbhajan)

#SN Thakur 
Thakur <- j[j$Bowling=="SN Thakur",]
Thakur <- col_add(Thakur, 13)
plot_add(Thakur)

#Umesh Yadav
Umesh <- j[j$Bowling=="UT Yadav",]
Umesh <- col_add(Umesh, 84)
plot_add(Umesh)

#Shakib Al Hasan
Shakib <- j[j$Bowling=="Shakib Al Hasan",]
Shakib <- col_add(Shakib, 35)
plot_add(Shakib)

#SL Malinga
library(forecast)
Malinga <- j[j$Bowling=="SL Malinga",]
Malinga <- col_add(Malinga, 88)
plot_add(Malinga)

Malinga_forecasts <- HoltWinters(Malinga$points, beta = F, gamma = F)
Malinga_forecasts
Malinga_forecasts_value <- forecast(Malinga_forecasts, h=2)
Malinga_forecasts_value
coef(Malinga_forecasts)
plot(Malinga_forecasts)
Malinga_ts <- ts(Malinga$points, start = c(1))
plot.ts(x=Malinga_ts)





#Regression equation
fit <- lm(points ~ M + W + Econ, data = j)
summary(fit )
coef(fit)
par(mfrow=c(2,2))
plot(fit)
Names <-data.frame(levels(j$Bowling))
Alphabetical_names <- with(Names, Names[order(Names$levels.j.Bowling.),])
Alphabetical_names
j[j$W>5,]
