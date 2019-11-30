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
new <- read.csv("bowler_dump_2018 latest.csv")
tail(new)
install.packages("forecast")

head(g)
head(a)
par(mfrow=c(1,1))

j <- rbind(a,b,c,d,e,f,g,h,i,new)
j
y <- 3
install.packages("ggplot2")
library(ggplot2)
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
data_bowl <- j[c(3,14)]
data_bowl

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
  Point_forecasts_value <- forecast(Point_forecasts, h=1)
  Point_forecasts_value
}

Fitted <- function(name){
  plot.ts(name$points)
  lines(HoltWinters(name$points, gamma=F)$fitted[,2], col = "red")
}



#Alphabetical order

Names_bowl <-data.frame(levels(data_bowl$Bowling))
Names_bowl
Alphabetical_names_bowler <- with(Names_bowl, Names_bowl[order(Names_bowl$levels.data_bowl.Bowling.),])
Alphabetical_names_bowler  <- data.frame(Alphabetical_names_bowler)
Alphabetical_names_bowler
#Bumrah

Bumrah <- data_bowl[data_bowl$Bowling=="JJ Bumrah",]
Bumrah
Bumrah <- col_add(Bumrah,57)
plot_add(Bumrah)
Predict(Bumrah)
Fitted(Bumrah)

#SP Narine
Narine_bowl <-  data_bowl[data_bowl$Bowling=="SP Narine",]
Narine_bowl <- col_add(Narine, 91)
plot_add(Narine)
Predict(Narine)
Fitted(Narine)

#Rashid Khan
Rashid <-  data_bowl[data_bowl$Bowling=="Rashid Khan",]
hist(Rashid$points)
Predict(Rashid)


Rashid <- col_add(Rashid, 23)
Rashid
plot_add(Rashid)
Fitted(Rashid)

#Rahman
Rahman<- data_bowl[data_bowl$Bowling=="Mustafizur Rahman",]
hist(Rahman$points)
Rahman <- col_add(Rahman,23)
plot_add(Rahman)
Predict(Rahman)
Fitted(Rahman)

#Kumar
Kumar <- data_bowl[data_bowl$Bowling=="B Kumar",]
hist(Kumar$points)
Kumar <- col_add(Kumar, 91)
plot_add(Kumar)
Predict(Kumar)

#Mitchell McClenaghan

McClenaghan <- j[j$Bowling=="MJ McClenaghan",]
hist(McClenaghan$points)
McClenaghan <- col_add(McClenaghan,40)
plot_add(McClenaghan)
Predict(McClenaghan)

#Washington Sundar
Washington <- data_bowl[data_bowl$Bowling=="Washington Sundar",]
hist(Washington$points)
Washington <- col_add(Washington, 17)
plot_add(Washington)
Predict(Washington)


#Billy Stanlake
Stanlake <- j[j$Bowling=="B Stanlake",]

#Mayank Markande
Markande <- j[j$Bowling=="M Markande",]
Markande
#YS Chahal
Chahal <- data_bowl[data_bowl$Bowling=="YS Chahal",]
Chahal <- col_add(Chahal,64)
plot_add(Chahal)
Predict(Chahal)

#Imran Tahir
Tahir <- j[j$Bowling=="Imran Tahir",]
Tahir <- col_add(Tahir, 32)
plot_add(Tahir)
Predict(Tahir)

#Mohammed Shami  
Shami <-  data_bowl[data_bowl$Bowling=="Mohammed Shami",]
Shami <- col_add(Shami, 35)
plot_add(Shami)
Predict(Shami)
Fitted(Shami)

#Harbhajan Singh
Harbhajan <- j[j$Bowling=="Harbhajan Singh",]
Harbhajan <- col_add(Harbhajan, 114)
plot_add(Harbhajan)
Predict(Harbhajan)

#SN Thakur 
Thakur <- j[j$Bowling=="SN Thakur",]
Thakur <- col_add(Thakur, 17)
plot_add(Thakur)

#Umesh Yadav
Umesh <- data_bowl[data_bowl$Bowling=="UT Yadav",]
Umesh <- col_add(Umesh, 93)
plot_add(Umesh)
Predict(Umesh)

#Shakib Al Hasan
Shakib_bowl <- data_bowl[data_bowl$Bowling=="Shakib Al Hasan",]
Shakib_bowl <- col_add(Shakib_bowl, 44)
plot_add(Shakib_bowl)
Predict(Shakib_bowl)

#Y K Pathan

Y_Pathan_bowl <- data_bowl[data_bowl$Bowling=="YK Pathan",]
Y_Pathan_bowl <- col_add(Y_Pathan_bowl, 61)
plot_add(Y_Pathan_bowl)
Predict(Y_Pathan_bowl)

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

#Mitchell Johnson

Mitchell <- data_bowl[data_bowl$Bowling=="MG Johnson",]
Mitchell <- col_add(Mitchell, 50)
plot_add(Mitchell)
Predict(Mitchell)
Fitted(Mitchell)

#Piyush Chawla
Alphabetical_names_bowler
Piyush <- data_bowl[data_bowl$Bowling=="PP Chawla",]
Piyush <- col_add(Piyush, 115)
plot_add(Piyush)
Predict(Piyush)
Fitted(Piyush)

#Andre Russel
Russel_bowl <- data_bowl[data_bowl$Bowling=="AD Russell",]
Russel_bowl <- col_add(Russel_bowl, 39)
plot_add(Russel_bowl)
Predict(Russel_bowl)
Fitted(Russel_bowl)

#Kuldeep yadav

Kuldeep <- data_bowl[data_bowl$Bowling=="Kuldeep Yadav",]
Kuldeep
Kuldeep <- col_add(Kuldeep, 20)
plot_add(Kuldeep)
Predict(Kuldeep)
Fitted(Kuldeep)

#Daniel Christian

DTChristian_bowl <- data_bowl[data_bowl$Bowling=="DT Christian",]
DTChristian_bowl <- col_add(DTChristian_bowl, 25)
plot_add(DTChristian_bowl)
Predict(DTChristian_bowl)
Fitted(DTChristian_bowl)

#Glen Maxwell

Maxwell_bowl <- data_bowl[data_bowl$Bowling=="GJ Maxwell",]
Maxwell_bowl <- col_add(Maxwell_bowl, 36)
plot_add(Maxwell_bowl)
Predict(Maxwell_bowl)
Fitted(Maxwell_bowl)

#Trent Boult

Trent <- data_bowl[data_bowl$Bowling=="TA Boult",]
Trent <- col_add(Trent, 20)
plot_add(Trent)
Predict(Trent)
Fitted(Trent)

#Shahbaz Nadeem

Nadeem <- data_bowl[data_bowl$Bowling=="S Nadeem",]
Nadeem <- col_add(Nadeem, 52)
plot_add(Nadeem)
Predict(Nadeem)
Fitted(Nadeem)

#Rahul Tewatia

Tewatia <- data_bowl[data_bowl$Bowling=="R Tewatia",] 
Tewatia
Tewatia <- col_add(Tewatia, 15)
plot_add(Tewatia)
Predict(Tewatia)

#Chris Morris

Morris_bowl <- data_bowl[data_bowl$Bowling=="CH Morris",] 
Morris_bowl <- col_add(Morris_bowl, 52)
plot_add(Morris_bowl)
Predict(Morris_bowl)
Fitted(Morris_bowl)

#S Sharma

Alphabetical_names_bowler
data_bowl
S_Sharma <- data_bowl[data_bowl$Bowling=="Sandeep Sharma",]
S_Sharma <- col_add(S_Sharma, 61)
plot_add(S_Sharma)
Predict(S_Sharma)

#S Kaul

Kaul <- data_bowl[data_bowl$Bowling=="S Kaul",]
Kaul <- col_add(Kaul, 30)
plot_add(Kaul)
Predict(Kaul)

#M Siraj

Siraj <- data_bowl[data_bowl$Bowling=="Mohammed Siraj",]
Alphabetical_names_bowler
Siraj <- col_add(Siraj, 12)
plot_add(Siraj)
Predict(Siraj)

#Basil Thampi

Thampi <- data_bowl[data_bowl$Bowling=="Basil Thampi",]
Alphabetical_names_bowler
Thampi <- col_add(Thampi, 15)
plot_add(Thampi)
Predict(Thampi)

#Tim Southee

Southee <- data_bowl[data_bowl$Bowling=="TG Southee",]
Alphabetical_names_bowler
Southee <- col_add(Southee, 27)
plot_add(Southee)
Predict(Southee)

#Grandhomme

Grandhomme_bowl <- data_bowl[data_bowl$Bowling=="C de Grandhomme",]
Grandhomme_bowl <- col_add(Grandhomme_bowl, 11)
plot_add(Grandhomme_bowl)
Predict(Grandhomme_bowl)

#M Ashwin

M_Ashwin <- data_bowl[data_bowl$Bowling=="M Ashwin",]
M_Ashwin <- col_add(M_Ashwin, 12)
plot_add(Grandhomme_bowl)
Predict(M_Ashwin)


#DL Chahar

DL Chahar_bowl <- data_bowl[data_bowl$Bowling== "DL Chahar",] 
DL Chahar_bowl <- col_add(DL Chahar_bowl,95)
plot_add(DL Chahar_bowl)
Predict(DL Chahar_bowl)


#SR Watson

SR_Watson_bowl <- data_bowl[data_bowl$Bowling== "SR Watson",] 
SR_Watson_bowl <- col_add(SR Watson_bowl,95)
plot_add(SR Watson_bowl)
Predict(SR_Watson_bowl)


#Harbhajan Singh

Harbhajan Singh_bowl <- data_bowl[data_bowl$Bowling== "Harbhajan Singh",] 
Harbhajan Singh_bowl <- col_add(Harbhajan Singh_bowl,95)
plot_add(Harbhajan Singh_bowl)
Predict(Harbhajan Singh_bowl)


#RA Jadeja

RA_Jadeja_bowl <- data_bowl[data_bowl$Bowling== "RA Jadeja",] 
RA Jadeja_bowl <- col_add(RA Jadeja_bowl,95)
plot_add(RA Jadeja_bowl)
Predict(RA_Jadeja_bowl)


#MA Wood

MA Wood_bowl <- data_bowl[data_bowl$Bowling== "MA Wood",] 
MA Wood_bowl <- col_add(MA Wood_bowl,95)
plot_add(MA Wood_bowl)
Predict(MA Wood_bowl)


#Imran Tahir

Imran Tahir_bowl <- data_bowl[data_bowl$Bowling== "Imran Tahir",] 
Imran Tahir_bowl <- col_add(Imran Tahir_bowl,95)
plot_add(Imran Tahir_bowl)
Predict(Imran Tahir_bowl)


#DJ Bravo

DJ_Bravo_bowl <- data_bowl[data_bowl$Bowling== "DJ Bravo",] 
DJ Bravo_bowl <- col_add(DJ Bravo_bowl,95)
plot_add(DJ Bravo_bowl)
Predict(DJ_Bravo_bowl)


#MJ McClenaghan

MJ McClenaghan_bowl <- data_bowl[data_bowl$Bowling== "MJ McClenaghan",] 
MJ McClenaghan_bowl <- col_add(MJ McClenaghan_bowl,95)
plot_add(MJ McClenaghan_bowl)
Predict(MJ McClenaghan_bowl)


#Mustafizur Rahman

Mustafizur Rahman_bowl <- data_bowl[data_bowl$Bowling== "Mustafizur Rahman",] 
Mustafizur Rahman_bowl <- col_add(Mustafizur Rahman_bowl,95)
plot_add(Mustafizur Rahman_bowl)
Predict(Mustafizur Rahman_bowl)


#JJ Bumrah

JJ Bumrah_bowl <- data_bowl[data_bowl$Bowling== "JJ Bumrah",] 
JJ Bumrah_bowl <- col_add(JJ Bumrah_bowl,95)
plot_add(JJ Bumrah_bowl)
Predict(JJ Bumrah_bowl)


#HH Pandya

HH_Pandya_bowl <- data_bowl[data_bowl$Bowling== "HH Pandya",] 
HH Pandya_bowl <- col_add(HH Pandya_bowl,95)
plot_add(HH Pandya_bowl)
Predict(HH_Pandya_bowl)


#M Markande

M_Markande_bowl <- data_bowl[data_bowl$Bowling== "M Markande",] 
M Markande_bowl <- col_add(M Markande_bowl,95)
plot_add(M Markande_bowl)
Predict(M_Markande_bowl)


#R Ashwin

R_Ashwin_bowl <- data_bowl[data_bowl$Bowling== "R Ashwin",] 
R Ashwin_bowl <- col_add(R Ashwin_bowl,95)
plot_add(R_Ashwin_bowl)
Predict(R_Ashwin_bowl)


#MM Sharma

MM Sharma_bowl <- data_bowl[data_bowl$Bowling== "MM Sharma",] 
MM Sharma_bowl <- col_add(MM Sharma_bowl,95)
plot_add(MM Sharma_bowl)
Predict(MM Sharma_bowl)


#Mujeeb Ur Rahman

Mujeeb_Ur_Rahman_bowl <- data_bowl[data_bowl$Bowling== "Mujeeb Ur Rahman",]
average <- average(Mujeeb_Ur_Rahman_bowl[,2])
Mujeeb Ur Rahman_bowl <- col_add(Mujeeb Ur Rahman_bowl,95)
plot_add(Mujeeb Ur Rahman_bowl)
Predict(Mujeeb_Ur_Rahman_bowl)


#AR Patel

AR_Patel_bowl <- data_bowl[data_bowl$Bowling== "AR Patel",] 
AR Patel_bowl <- col_add(AR Patel_bowl,95)
plot_add(AR Patel_bowl)
Predict(AR_Patel_bowl)


#AJ Tye

Tye_bowl <- data_bowl[data_bowl$Bowling== "AJ Tye",] 
AJ Tye_bowl <- col_add(AJ Tye_bowl,95)
plot_add(AJ Tye_bowl)
Predict(Tye_bowl)


#MP Stoinis

Stoinis_bowl <- data_bowl[data_bowl$Bowling== "MP Stoinis",] 
MP Stoinis_bowl <- col_add(MP Stoinis_bowl,95)
plot_add(MP Stoinis_bowl)
Predict(Stoinis_bowl)


#TA Boult

TA Boult_bowl <- data_bowl[data_bowl$Bowling== "TA Boult",] 
TA Boult_bowl <- col_add(TA Boult_bowl,95)
plot_add(TA Boult_bowl)
Predict(TA Boult_bowl)


#Mohammed Shami

Mohammed Shami_bowl <- data_bowl[data_bowl$Bowling== "Mohammed Shami",] 
Mohammed Shami_bowl <- col_add(Mohammed Shami_bowl,95)
plot_add(Mohammed Shami_bowl)
Predict(Mohammed Shami_bowl)


#A Mishra

A_Mishra_bowl <- data_bowl[data_bowl$Bowling== "A Mishra",] 
A Mishra_bowl <- col_add(A Mishra_bowl,95)
plot_add(A Mishra_bowl)
Predict(A_Mishra_bowl)


#CH Morris

CH Morris_bowl <- data_bowl[data_bowl$Bowling== "CH Morris",] 
CH Morris_bowl <- col_add(CH Morris_bowl,95)
plot_add(CH Morris_bowl)
Predict(CH Morris_bowl)


#DT Christian

DT Christian_bowl <- data_bowl[data_bowl$Bowling== "DT Christian",] 
DT Christian_bowl <- col_add(DT Christian_bowl,95)
plot_add(DT Christian_bowl)
Predict(DT Christian_bowl)


#R Tewatia

R Tewatia_bowl <- data_bowl[data_bowl$Bowling== "R Tewatia",] 
R Tewatia_bowl <- col_add(R Tewatia_bowl,95)
plot_add(R Tewatia_bowl)
Predict(R Tewatia_bowl)


#R Vinay Kumar

R Vinay Kumar_bowl <- data_bowl[data_bowl$Bowling== "R Vinay Kumar",] 
R Vinay Kumar_bowl <- col_add(R Vinay Kumar_bowl,95)
plot_add(R Vinay Kumar_bowl)
Predict(R Vinay Kumar_bowl)


#PP Chawla

PP Chawla_bowl <- data_bowl[data_bowl$Bowling== "PP Chawla",] 
PP Chawla_bowl <- col_add(PP Chawla_bowl,95)
plot_add(PP Chawla_bowl)
Predict(PP Chawla_bowl)


#Kuldeep Yadav

Kuldeep Yadav_bowl <- data_bowl[data_bowl$Bowling== "Kuldeep Yadav",] 
Kuldeep Yadav_bowl <- col_add(Kuldeep Yadav_bowl,95)
plot_add(Kuldeep Yadav_bowl)
Predict(Kuldeep Yadav_bowl)


#SP Narine

SP_Narine_bowl <- data_bowl[data_bowl$Bowling== "SP Narine",] 
SP Narine_bowl <- col_add(SP Narine_bowl,95)
plot_add(SP Narine_bowl)
Predict(SP_Narine_bowl)


#MG Johnson

MG Johnson_bowl <- data_bowl[data_bowl$Bowling== "MG Johnson",] 
MG Johnson_bowl <- col_add(MG Johnson_bowl,95)
plot_add(MG Johnson_bowl)
Predict(MG Johnson_bowl)


#AD Russell

AD_Russell_bowl <- data_bowl[data_bowl$Bowling== "AD Russell",] 
AD Russell_bowl <- col_add(AD Russell_bowl,95)
plot_add(AD Russell_bowl)
Predict(AD_Russell_bowl)


#N Rana

N Rana_bowl <- data_bowl[data_bowl$Bowling== "N Rana",] 
N Rana_bowl <- col_add(N Rana_bowl,95)
plot_add(N Rana_bowl)
Predict(N Rana_bowl)


#YS Chahal

YS Chahal_bowl <- data_bowl[data_bowl$Bowling== "YS Chahal",] 
YS Chahal_bowl <- col_add(YS Chahal_bowl,95)
plot_add(YS Chahal_bowl)
Predict(YS Chahal_bowl)


#CR Woakes

CR Woakes_bowl <- data_bowl[data_bowl$Bowling== "CR Woakes",] 
CR Woakes_bowl <- col_add(CR Woakes_bowl,95)
plot_add(CR Woakes_bowl)
Predict(CR Woakes_bowl)


#Washington Sundar

Washington Sundar_bowl <- data_bowl[data_bowl$Bowling== "Washington Sundar",] 
Washington Sundar_bowl <- col_add(Washington Sundar_bowl,95)
plot_add(Washington Sundar_bowl)
Predict(Washington Sundar_bowl)


#UT Yadav

UT Yadav_bowl <- data_bowl[data_bowl$Bowling== "UT Yadav",] 
UT Yadav_bowl <- col_add(UT Yadav_bowl,95)
plot_add(UT Yadav_bowl)
Predict(UT Yadav_bowl)


#K Khejroliya

K Khejroliya_bowl <- data_bowl[data_bowl$Bowling== "K Khejroliya",] 
K Khejroliya_bowl <- col_add(K Khejroliya_bowl,95)
plot_add(K Khejroliya_bowl)
Predict(K Khejroliya_bowl)


#B Kumar

B_Kumar_bowl <- data_bowl[data_bowl$Bowling== "B Kumar",] 
B_Kumar_bowl <- col_add(B_Kumar_bowl,92)
plot_add(B_Kumar_bowl)
Predict(B_Kumar_bowl)


#B Stanlake

B Stanlake_bowl <- data_bowl[data_bowl$Bowling== "B Stanlake",] 
B Stanlake_bowl <- col_add(B Stanlake_bowl,95)
plot_add(B Stanlake_bowl)
Predict(B Stanlake_bowl)


#Shakib Al Hasan

Shakib_Al_Hasan_bowl <- data_bowl[data_bowl$Bowling== "Shakib Al Hasan",] 
Shakib Al Hasan_bowl <- col_add(Shakib Al Hasan_bowl,95)
plot_add(Shakib Al Hasan_bowl)
Predict(Shakib_Al_Hasan_bowl)


#S Kaul

S_Kaul_bowl <- data_bowl[data_bowl$Bowling== "S Kaul",] 
S Kaul_bowl <- col_add(S Kaul_bowl,95)
plot_add(S Kaul_bowl)
Predict(S_Kaul_bowl)


#Rashid Khan

Rashid_Khan_bowl <- data_bowl[data_bowl$Bowling== "Rashid Khan",] 
Rashid Khan_bowl <- col_add(Rashid Khan_bowl,95)
plot_add(Rashid Khan_bowl)
Predict(Rashid_Khan_bowl)


#DS Kulkarni

DS_Kulkarni_bowl <- data_bowl[data_bowl$Bowling== "DS Kulkarni",] 
DS Kulkarni_bowl <- col_add(DS Kulkarni_bowl,95)
plot_add(DS Kulkarni_bowl)
Predict(DS_Kulkarni_bowl)


#JD Unadkat

Unadkat_bowl <- data_bowl[data_bowl$Bowling== "JD Unadkat",] 
JD Unadkat_bowl <- col_add(JD Unadkat_bowl,95)
plot_add(JD Unadkat_bowl)
Predict(Unadkat_bowl)


#K Gowtham

Gowtham_bowl <- data_bowl[data_bowl$Bowling== "K Gowtham",] 
K Gowtham_bowl <- col_add(K Gowtham_bowl,95)
plot_add(K Gowtham_bowl)
Predict(Gowtham_bowl)


#B Laughlin

B Laughlin_bowl <- data_bowl[data_bowl$Bowling== "B Laughlin",] 
B Laughlin_bowl <- col_add(B Laughlin_bowl,95)
plot_add(B Laughlin_bowl)
Predict(B Laughlin_bowl)


#S Gopal

Gopal_bowl <- data_bowl[data_bowl$Bowling== "S Gopal",]
S Gopal_bowl <- col_add(S Gopal_bowl,95)
plot_add(S Gopal_bowl)
Predict(Gopal_bowl)


#BA Stokes

BA_Stokes_bowl <- data_bowl[data_bowl$Bowling== "BA Stokes",] 
BA Stokes_bowl <- col_add(BA Stokes_bowl,95)
plot_add(BA Stokes_bowl)
Predict(BA_Stokes_bowl)


#DJM Short

DJM Short_bowl <- data_bowl[data_bowl$Bowling== "DJM Short",] 
DJM Short_bowl <- col_add(DJM Short_bowl,95)
plot_add(DJM Short_bowl)
Predict(DJM Short_bowl)


#SN Thakur

SN_Thakur_bowl <- data_bowl[data_bowl$Bowling== "SN Thakur",] 
SN Thakur_bowl <- col_add(SN Thakur_bowl,95)
plot_add(SN Thakur_bowl)
Predict(SN_Thakur_bowl)


#TK Curran

TK_Curran_bowl <- data_bowl[data_bowl$Bowling== "TK Curran",] 
TK Curran_bowl <- col_add(TK Curran_bowl,95)
plot_add(TK Curran_bowl)
Predict(TK Curran_bowl)


#S Nadeem

S_Nadeem_bowl <- data_bowl[data_bowl$Bowling== "S Nadeem",] 
S Nadeem_bowl <- col_add(S Nadeem_bowl,95)
plot_add(S Nadeem_bowl)
Predict(S_Nadeem_bowl)


#Sandeep Sharma

Sandeep_Sharma_bowl <- data_bowl[data_bowl$Bowling== "Sandeep Sharma",] 
Sandeep Sharma_bowl <- col_add(Sandeep Sharma_bowl,95)
plot_add(Sandeep Sharma_bowl)
Predict(Sandeep_Sharma_bowl)


#PJ Sangwan

PJ Sangwan_bowl <- data_bowl[data_bowl$Bowling== "PJ Sangwan",] 
PJ Sangwan_bowl <- col_add(PJ Sangwan_bowl,95)
plot_add(PJ Sangwan_bowl)
Predict(PJ Sangwan_bowl)


#BCJ Cutting

BCJ_Cutting_bowl <- data_bowl[data_bowl$Bowling== "BCJ Cutting",] 
BCJ Cutting_bowl <- col_add(BCJ Cutting_bowl,95)
plot_add(BCJ Cutting_bowl)
Predict(BCJ_Cutting_bowl)


#KH Pandya

KH_Pandya_bowl <- data_bowl[data_bowl$Bowling== "KH Pandya",] 
KH Pandya_bowl <- col_add(KH Pandya_bowl,95)
plot_add(KH Pandya_bowl)
Predict(KH_Pandya_bowl)


#GJ Maxwell

GJ_Maxwell_bowl <- data_bowl[data_bowl$Bowling== "GJ Maxwell",] 
GJ Maxwell_bowl <- col_add(GJ Maxwell_bowl,95)
plot_add(GJ Maxwell_bowl)
Predict(GJ_Maxwell_bowl)


#A Dananjaya

A Dananjaya_bowl <- data_bowl[data_bowl$Bowling== "A Dananjaya",] 
A Dananjaya_bowl <- col_add(A Dananjaya_bowl,95)
plot_add(A Dananjaya_bowl)
Predict(A Dananjaya_bowl)


#Shivam Mavi

Shivam_Mavi_bowl <- data_bowl[data_bowl$Bowling== "Shivam Mavi",] 
Shivam Mavi_bowl <- col_add(Shivam Mavi_bowl,95)
plot_add(Shivam Mavi_bowl)
Predict(Shivam Mavi_bowl)


#P Negi

P Negi_bowl <- data_bowl[data_bowl$Bowling== "P Negi",] 
P Negi_bowl <- col_add(P Negi_bowl,95)
plot_add(P Negi_bowl)
Predict(P Negi_bowl)


#BB Sran

BB Sran_bowl <- data_bowl[data_bowl$Bowling== "BB Sran",] 
BB Sran_bowl <- col_add(BB Sran_bowl,95)
plot_add(BB Sran_bowl)
Predict(BB Sran_bowl)


#Yuvraj Singh

Yuvraj_Singh_bowl <- data_bowl[data_bowl$Bowling== "Yuvraj Singh",] 
Yuvraj Singh_bowl <- col_add(Yuvraj Singh_bowl,95)
plot_add(Yuvraj Singh_bowl)
Predict(Yuvraj_Singh_bowl)


#V Shankar

V_Shankar_bowl <- data_bowl[data_bowl$Bowling== "V Shankar",] 
V_Shankar_bowl
V Shankar_bowl <- col_add(V Shankar_bowl,95)
plot_add(V Shankar_bowl)
Predict(V Shankar_bowl)


#Mohammed Siraj

Mohammed Siraj_bowl <- data_bowl[data_bowl$Bowling== "Mohammed Siraj",] 
Mohammed Siraj_bowl <- col_add(Mohammed Siraj_bowl,95)
plot_add(Mohammed Siraj_bowl)
Predict(Mohammed Siraj_bowl)


#CJ Anderson

CJ Anderson_bowl <- data_bowl[data_bowl$Bowling== "CJ Anderson",] 
CJ Anderson_bowl <- col_add(CJ Anderson_bowl,95)
plot_add(CJ Anderson_bowl)
Predict(CJ Anderson_bowl)


#CJ Jordan

CJ Jordan_bowl <- data_bowl[data_bowl$Bowling== "CJ Jordan",] 
CJ Jordan_bowl <- col_add(CJ Jordan_bowl,95)
plot_add(CJ Jordan_bowl)
Predict(CJ Jordan_bowl)


#DJ Hooda

DJ Hooda_bowl <- data_bowl[data_bowl$Bowling== "DJ Hooda",] 
DJ Hooda_bowl <- col_add(DJ Hooda_bowl,95)
plot_add(DJ Hooda_bowl)
Predict(DJ Hooda_bowl)


#STR Binny

STR_Binny_bowl <- data_bowl[data_bowl$Bowling== "STR Binny",] 
STR Binny_bowl <- col_add(STR Binny_bowl,95)
plot_add(STR Binny_bowl)
Predict(STR_Binny_bowl)


#KV Sharma

KV Sharma_bowl <- data_bowl[data_bowl$Bowling== "KV Sharma",] 
KV Sharma_bowl <- col_add(KV Sharma_bowl,95)
plot_add(KV Sharma_bowl)
Predict(KV Sharma_bowl)


#AS Rajpoot

AS_Rajpoot_bowl <- data_bowl[data_bowl$Bowling== "AS Rajpoot",] 
AS_Rajpoot_bowl <- col_add(AS_Rajpoot_bowl,95)
plot_add(AS_Rajpoot_bowl)
Predict(AS_Rajpoot_bowl)


#HV Patel

HV_Patel_bowl <- data_bowl[data_bowl$Bowling== "HV Patel",] 
HV_Patel_bowl <- col_add(HV Patel_bowl,95)
plot_add(HV Patel_bowl)
Predict(HV_Patel_bowl)


#JC Archer

JC_Archer_bowl <- data_bowl[data_bowl$Bowling== "JC Archer",] 
JC Archer_bowl <- col_add(JC Archer_bowl,95)
plot_add(JC Archer_bowl)
Predict(JC_Archer_bowl)
JC_Archer_bowl


#Avesh Khan

Avesh_Khan_bowl <- data_bowl[data_bowl$Bowling== "Avesh Khan",]
Avesh_Khan_bowl
Avesh Khan_bowl <- col_add(Avesh Khan_bowl,95)
plot_add(Avesh Khan_bowl)
Predict(Avesh Khan_bowl)


#LE Plunkett

LE_Plunkett_bowl <- data_bowl[data_bowl$Bowling== "LE Plunkett",] 
LE_Plunkett_bowl
LE Plunkett_bowl <- col_add(LE Plunkett_bowl,95)
plot_add(LE Plunkett_bowl)
Predict(LE_Plunkett_bowl)


#Mohammad Nabi

Mohammad Nabi_bowl <- data_bowl[data_bowl$Bowling== "Mohammad Nabi",] 
Mohammad Nabi_bowl <- col_add(Mohammad Nabi_bowl,95)
plot_add(Mohammad Nabi_bowl)
Predict(Mohammad Nabi_bowl)


#Basil Thampi

Basil_Thampi_bowl <- data_bowl[data_bowl$Bowling== "Basil Thampi",] 
Basil Thampi_bowl <- col_add(Basil Thampi_bowl,95)
plot_add(Basil Thampi_bowl)
Predict(Basil_Thampi_bowl)


#MK Tiwary

MK Tiwary_bowl <- data_bowl[data_bowl$Bowling== "MK Tiwary",] 
MK Tiwary_bowl <- col_add(MK Tiwary_bowl,95)
plot_add(MK Tiwary_bowl)
Predict(MK Tiwary_bowl)


#IS Sodhi

IS_Sodhi_bowl <- data_bowl[data_bowl$Bowling== "IS Sodhi",] 
IS Sodhi_bowl <- col_add(IS Sodhi_bowl,95)
plot_add(IS Sodhi_bowl)
Predict(IS_Sodhi_bowl)


#MK Lomror

MK_Lomror_bowl <- data_bowl[data_bowl$Bowling== "MK Lomror",]
MK_Lomror_bowl
MK Lomror_bowl <- col_add(MK Lomror_bowl,95)
plot_add(MK Lomror_bowl)
Predict(MK Lomror_bowl)


#YK Pathan

YK_Pathan_bowl <- data_bowl[data_bowl$Bowling== "YK Pathan",] 
YK Pathan_bowl <- col_add(YK Pathan_bowl,95)
plot_add(YK Pathan_bowl)
Predict(YK_Pathan_bowl)


#TG Southee

TG Southee_bowl <- data_bowl[data_bowl$Bowling== "TG Southee",] 
TG Southee_bowl <- col_add(TG Southee_bowl,95)
plot_add(TG Southee_bowl)
Predict(TG Southee_bowl)


#M Ashwin

M Ashwin_bowl <- data_bowl[data_bowl$Bowling== "M Ashwin",] 
M Ashwin_bowl <- col_add(M Ashwin_bowl,95)
plot_add(M Ashwin_bowl)
Predict(M Ashwin_bowl)


#L Ngidi

L_Ngidi_bowl <- data_bowl[data_bowl$Bowling== "L Ngidi",]
L_Ngidi_bowl
L Ngidi_bowl <- col_add(L Ngidi_bowl,95)
plot_add(L Ngidi_bowl)
Predict(L Ngidi_bowl)


#KM Asif

KM Asif_bowl <- data_bowl[data_bowl$Bowling== "KM Asif",] 
KM Asif_bowl <- col_add(KM Asif_bowl,95)
plot_add(KM Asif_bowl)
Predict(KM Asif_bowl)


#JP Duminy

JP_Duminy_bowl <- data_bowl[data_bowl$Bowling== "JP Duminy",] 
JP Duminy_bowl <- col_add(JP Duminy_bowl,95)
plot_add(JP Duminy_bowl)
Predict(JP_Duminy_bowl)


#C de Grandhomme

C de Grandhomme_bowl <- data_bowl[data_bowl$Bowling== "C de Grandhomme",] 
C de Grandhomme_bowl <- col_add(C de Grandhomme_bowl,95)
plot_add(C de Grandhomme_bowl)
Predict(C de Grandhomme_bowl)


#DJ Willey

DJ Willey_bowl <- data_bowl[data_bowl$Bowling== "DJ Willey",] 
DJ Willey_bowl <- col_add(DJ Willey_bowl,95)
plot_add(DJ Willey_bowl)
Predict(DJ Willey_bowl)


#M Prasidh Krishna

M Prasidh Krishna_bowl <- data_bowl[data_bowl$Bowling== "M Prasidh Krishna",] 
M Prasidh Krishna_bowl <- col_add(M Prasidh Krishna_bowl,95)
plot_add(M Prasidh Krishna_bowl)
Predict(M Prasidh Krishna_bowl)


#Anureet Singh

Anureet_Singh_bowl <- data_bowl[data_bowl$Bowling== "Anureet Singh",] 
Anureet Singh_bowl <- col_add(Anureet Singh_bowl,95)
plot_add(Anureet Singh_bowl)
Predict(Anureet_Singh_bowl)


#Kieren Pollard

Alphabetical_names_bowler
Pollard_bowl <- data_bowl[data_bowl$Bowling== "KA Pollard",] 
Predict(Pollard_bowl)




