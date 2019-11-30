getwd()
setwd("/Users/devottambhattacharya/Documents/IPL data/IPL Batsmen")


data_new <- read.csv("Batsmen_final_dump_wpts_clean.csv")
data_new
data_2018 <- read.csv("Batsmen_final_dump_wpts _match47.csv")
data_2018
data_new[!complete.cases(data_new),]
data_2018[!complete.cases(data_2018),]



data_new <- data_new[c(2,15)]
head(data_new)
data_2018 <- data_2018[c(3,15)]
head(data_2018)
data_bat <- rbind(data_new, data_2018)
head(data_bat)
colnames(data_bat)[2] <- "points"
data_test <- data_bat
head(data_test)
str(data_test)
par(mfrow=c(1,1))


#Alphabetical order

Names_bat <-data.frame(levels(data_bat$BATSMEN))
Names_bat
Alphabetical_names_batsmen <- with(Names_bat, Names_bat[order(Names_bat$levels.data_test.BATSMEN.),])
Alphabetical_names_batsmen  <- data.frame(Alphabetical_names_batsmen)
Alphabetical_names_batsmen
#In descending order of points
data_descending_points <- data_1[order(-data_1$points),]
data_descending_points
str(data$points)

Alphabetical_names_batsmen


#clean data : data_test

#FUNCTIONS

col_add <- function(Name, row){
  Name <- cbind(data.frame(seq(1,row,1)), Name)
  colnames(Name)[1] <- "seq"
  return(as.data.frame(Name))
}

plot_add <- function(Name){
  ggplot(data = Name, aes(x=seq, y= points)) + geom_point() + geom_line()+stat_smooth()
}
?geom_smooth

Predict <- function(Name){
  Point_forecasts <- HoltWinters(Name$points,beta = F, gamma = F)
  Point_forecasts
  Point_forecasts_value <- forecast(Point_forecasts, h=1)
  plot(Point_forecasts_value)
  Point_forecasts_value
  
}
HoltWinters

Fitted <- function(name){
  plot.ts(name$points)
  lines(HoltWinters(name$points, gamma=F)$fitted[,2], col = "red")
}
Test_Train <- function(name, end, start, end_2){
  name.train <- window(name, end=end)
  return (name.train)
  name.test <- window(Yuvraj, start=start, end=end_2)
  return(name.test)
  
  
}

#Virat Kohli

Kohli <- data_bat[data_bat$BATSMEN=="VKohli",]
Kohli

#Kohli_c <- data_1[data_1$BATSMEN=="VKohli(c)",]
#Kohli <- rbind(Kohli_c, Kohli)
Kohli <- col_add(Kohli, 95)


plot_add(Kohli)
Fitted(Kohli)

Predict(Kohli)

#Chris Gayle

Gayle <- data_test[data_test$BATSMEN=="CHGayle",]
Gayle
head(Gayle)
Gayle <- col_add(Gayle, 74)
plot_add(Gayle)
Predict(Gayle)
Fitted(Gayle)

#Suresh Raina

Raina_c <- data_test[data_test$BATSMEN=="SKRaina",]
Raina_c <- col_add(Raina_c, 96)
plot_add(Raina_c)
Predict(Raina_c)
Fitted(Raina_c)

#Yuvraj Singh

Yuvraj <- data_test[data_test$BATSMEN=="YuvrajSingh",]
Yuvraj <- col_add(Yuvraj, 65)
Yuvraj
#Yuvraj <- ts(Yuvraj)
Yuvraj.train <- window(Yuvraj, end=62)
Yuvraj.train
Yuvraj.test <- window(Yuvraj, start=63, end=65)
plot_add(Yuvraj)
Predict(Yuvraj)

autoplot(Yuvraj)
plot_add(Yuvraj)
HW_forecast <- HoltWinters(Yuvraj.train, gamma = F)
HW_forecast
Yuvraj_fcast <- forecast(HW_forecast, h=3)
Yuvraj_fcast
accuracy( Yuvraj_fcast, Yuvraj.test)
HW_forecast_expo <- HoltWinters(Yuvraj.train,beta = F, gamma = F)
Yuvraj_fcast_ex <- forecast(HW_forecast_expo, h=3)
accuracy(Yuvraj_fcast_ex, Yuvraj.test)
Fitted(Yuvraj)

#Ab De Villiers

ABDe <- data_bat[data_bat$BATSMEN=="ABdeVilliers",]
Predict(ABDe)
Alphabetical_names_batsmen 

#ABDE_1 <- data_1[data_1$BATSMEN=="ABdeVilliers",]
#ABDe <- rbind(ABDe, ABDE_1)


ABDe <- col_add(ABDe, 85)
plot_add(ABDe)
Predict(ABDe)
Fitted(ABDe)

#MandeepSingh 

Mandeep_Singh <- data_bat[data_bat$BATSMEN=="MandeepSingh",]
Mandeep_Singh <- col_add(Mandeep_Singh, 60)
plot_add(Mandeep_Singh)
Predict(Mandeep_Singh)
Fitted(Mandeep_Singh)


#Ambati Rayudu

A_Rayudu <- data_test[data_test$BATSMEN=="ATRayudu",]
A_Rayudu <- col_add(A_Rayudu, 77)
plot_add(A_Rayudu)
Predict(A_Rayudu)


#Sam Billings

Billings <- data_test[data_test$BATSMEN=="SWBillings",]
Billings <- col_add(Billings, 13)
plot_add(Billings)
Predict(Billings)

Alphabetical_names_batsmen

#Brendon McCulum

McCullum <- data_bat[data_bat$BATSMEN=="BBMcCullum",]
McCullum <- col_add(McCullum, 69)
plot_add(McCullum)
Predict(McCullum)

#Murali Vijay

Vijay <- data_test[data_test$BATSMEN=="MVijay",]
Vijay <- col_add(Vijay, 61)
plot_add(Vijay)
Predict(Vijay)

#Uthappa

Uthappa <- data_test[data_test$BATSMEN=="RVUthappa",]
Uthappa <- col_add(Uthappa,95)
plot_add(Uthappa)
Predict(Uthappa)

#Chris Lynn

Alphabetical_names_batsmen
Lynn <- data_test[data_test$BATSMEN=="CALynn",]
Lynn <- col_add(Lynn, 18)
plot_add(Lynn)
Predict(Lynn)

#G Gambhir

Gambhir <- data_test[data_test$BATSMEN=="GGambhir",]
Gambhir <- col_add(Gambhir, 88)
plot_add(Gambhir)
Predict(Gambhir)

#Shreyas iyer

Shreyas <- data_test[data_test$BATSMEN=="SSIyer",]
Shreyas <- col_add(Shreyas, 37)
plot_add(Shreyas)
Predict(Shreyas)

#Nitish Rana

Rana <- data_test[data_test$BATSMEN=="NRana",]
Rana <- col_add(Rana, 21)
plot_add(Rana)
Predict(Rana)

#Shubham Gill

Gill <- data_test[data_test$BATSMEN=="ShubmanGill",]

#Jason Roy

Jason <- data_test[data_test$BATSMEN=="JJRoy",]

#Dinesh Karthik

Karthik <- data_test[data_test$BATSMEN=="KDKarthik",]
Karthik
Karthik <- col_add(Karthik, 89)
plot_add(Karthik)
Predict(Karthik)

#Rishabh Pant

Pant <- data_test[data_test$BATSMEN=="RRPant",]
Pant <- col_add(Pant, 30)
plot_add(Pant)
Predict(Pant)

#Naman Ojha

Ojha <- data_test[data_test$BATSMEN=="NVOjha",]
Ojha <- col_add(Ojha, 55)
plot_add(Ojha)
Predict(Ojha)
Fitted(Ojha)

#Andre Russell

Alphabetical_names_batsmen
Russel_bat <- data_test[data_test$BATSMEN=="ADRussell",]
Russel_bat <- col_add(Russel_bat,29)
plot_add(Russel_bat)
Predict(Russel_bat)
Fitted(Russel_bat)

#Sunil Narine

Narine_bat <- data_test[data_test$BATSMEN=="SPNarine",]
Narine_bat <- col_add(Narine_bat, 35)
plot_add(Narine_bat)
Predict(Narine_bat)
Fitted(Narine_bat)

#Glen Maxwell

Maxwell_bat <- data_test[data_test$BATSMEN=="GJMaxwell",]
Maxwell_bat <- col_add(Maxwell_bat, 58)
plot_add(Maxwell_bat)
Predict(Maxwell_bat)
Fitted(Maxwell_bat)

#Daniel Christian

DTChristian_bat <- data_test[data_test$BATSMEN=="DTChristian",]
DTChristian_bat <- col_add(DTChristian_bat, 18)
plot_add(DTChristian_bat)
Predict(DTChristian_bat)
Fitted(DTChristian_bat)

#Chris Morris
Alphabetical_names_batsmen
Morris_bat <- data_test[data_test$BATSMEN=="CHMorris",]
Morris_bat <- col_add(Morris_bat, 31)
plot_add(Morris_bat)
Predict(Morris_bat)
Fitted(Morris_bat)

#MS Dhoni

Dhoni <- data_test[data_test$BATSMEN=="MSDhoni",]
Dhoni <- col_add(Dhoni, 91)
plot_add(Dhoni) 
Predict(Dhoni)
Fitted(Dhoni)

#QdeKock

QdeKock <- data_bat[data_bat$BATSMEN=="QdeKock",]
QdeKock <- col_add(QdeKock, 34)
plot_add(QdeKock)
Predict(QdeKock)
Fitted(QdeKock)


#Warner

Warner <- data_test[data_test$BATSMEN=="DAWarner",]
Warner <- col_add(Warner, 80)
plot_add(Warner)
Predict(Warner)
Fitted(Warner)

#WP Saha

Alphabetical_names_batsmen
Saha <-  data_bat[data_bat$BATSMEN=="WPSaha",]
Saha <- col_add(Saha, 61)
plot_add(Saha)
Predict(Saha)

#Parthiv Patel

P_Patel <-  data_bat[data_bat$BATSMEN=="PAPatel",]
P_Patel <- col_add(P_Patel, 75)
plot_add(P_Patel)
Predict(P_Patel)

#Manish Pandey

M_Pandey <- data_bat[data_bat$BATSMEN=="MKPandey",]
M_Pandey <- col_add(M_Pandey, 74)
plot_add(M_Pandey)
Predict(M_Pandey)

#Shikhar Dhawan

Dhawan <- data_bat[data_bat$BATSMEN=="SDhawan",]
Dhawan <- col_add(Dhawan, 89)
plot_add(Dhawan)
Predict(Dhawan)

#Williamson

Williamson <- data_bat[data_bat$BATSMEN=="KSWilliamson",]
Williamson <- col_add(Williamson, 24)
plot_add(Williamson)
Predict(Williamson)

#Alex Hales

Hales <- data_bat[data_bat$BATSMEN=="ADHales",]
Hales
Hales <- col_add(Hales, 2)
plot_add(Hales)
Predict(Hales)

#M Vohra 

Vohra <- data_bat[data_bat$BATSMEN=="MVohra",]
Vohra <- col_add(Vohra, 44)
plot_add(Vohra)
Predict(Vohra)

#Hasan

Shakib_bat <- data_bat[data_bat$BATSMEN=="ShakibAlHasan",]
Alphabetical_names_batsmen
Shakib_bat <- col_add(Shakib_bat, 34)
plot_add(Shakib_bat)
Predict(Shakib_bat)

#YK Pathan

YK_Pathan_bat <- data_bat[data_bat$BATSMEN=="YKPathan",]
YK_Pathan_bat <- col_add(YK_Pathan_bat, 84)
plot_add(YK_Pathan_bat)
Predict(YK_Pathan_bat)

#Grandhomme

Grandhomme_bat <- data_bat[data_bat$BATSMEN=="CdeGrandhomme",]
Grandhomme_bat <- col_add(Grandhomme_bat, 13)
plot_add(Grandhomme_bat)
Predict(Grandhomme_bat)

#RGSharma

RGSharma_bat <- data_bat[data_bat$BATSMEN== "RGSharma",] 
RGSharma_bat <- col_add(RGSharma_bat,95)
plot_add(RGSharma_bat)
Predict(RGSharma_bat)


#Elewis

Alphabetical_names_batsmen
Elewis_bat <- data_bat[data_bat$BATSMEN== "ELewis",] 
Elewis_bat <- col_add(Elewis_bat,95)
plot_add(Elewis_bat)
Predict(Elewis_bat)


#IshanKishan

IshanKishan_bat <- data_bat[data_bat$BATSMEN== "IshanKishan",] 
IshanKishan_bat <- col_add(IshanKishan_bat,95)
plot_add(IshanKishan_bat)
Predict(IshanKishan_bat)


#SAYadav

SAYadav_bat <- data_bat[data_bat$BATSMEN== "SAYadav",] 
SAYadav_bat <- col_add(SAYadav_bat,95)
plot_add(SAYadav_bat)
Predict(SAYadav_bat)


#HHPandya

HHPandya_bat <- data_bat[data_bat$BATSMEN== "HHPandya",] 
HHPandya_bat <- col_add(HHPandya_bat,95)
plot_add(HHPandya_bat)
Predict(HHPandya_bat)


#KHPandya

KHPandya_bat <- data_bat[data_bat$BATSMEN== "KHPandya",] 
KHPandya_bat <- col_add(KHPandya_bat,95)
plot_add(KHPandya_bat)
Predict(KHPandya_bat)


#SRWatson

SRWatson_bat <- data_bat[data_bat$BATSMEN== "SRWatson",] 
SRWatson_bat <- col_add(SRWatson_bat,95)
plot_add(SRWatson_bat)
Predict(SRWatson_bat)


#ATRayudu

ATRayudu_bat <- data_bat[data_bat$BATSMEN== "ATRayudu",] 
ATRayudu_bat <- col_add(ATRayudu_bat,95)
plot_add(ATRayudu_bat)
Predict(ATRayudu_bat)


#SKRaina

SKRaina_bat <- data_bat[data_bat$BATSMEN== "SKRaina",] 
SKRaina_bat <- col_add(SKRaina_bat,95)
plot_add(SKRaina_bat)
Predict(SKRaina_bat)


#KMJadhav

KMJadhav_bat <- data_bat[data_bat$BATSMEN== "KMJadhav",] 
KMJadhav_bat <- col_add(KMJadhav_bat,95)
plot_add(KMJadhav_bat)
Predict(KMJadhav_bat)


#MSDhoni

MSDhoni_bat <- data_bat[data_bat$BATSMEN== "MSDhoni",] 
MSDhoni_bat <- col_add(MSDhoni_bat,95)
plot_add(MSDhoni_bat)
Predict(MSDhoni_bat)


#RAJadeja

RAJadeja_bat <- data_bat[data_bat$BATSMEN== "RAJadeja",] 
RAJadeja_bat <- col_add(RAJadeja_bat,95)
plot_add(RAJadeja_bat)
Predict(RAJadeja_bat)


#DJBravo

DJBravo_bat <- data_bat[data_bat$BATSMEN== "DJBravo",] 
DJBravo_bat <- col_add(DJBravo_bat,95)
plot_add(DJBravo_bat)
Predict(DJBravo_bat)


#DLChahar

DLChahar_bat <- data_bat[data_bat$BATSMEN== "DLChahar",] 
DLChahar_bat <- col_add(DLChahar_bat,95)
plot_add(DLChahar_bat)
Predict(DLChahar_bat)


#HarbhajanSingh

HarbhajanSingh_bat <- data_bat[data_bat$BATSMEN== "HarbhajanSingh",] 
HarbhajanSingh_bat <- col_add(HarbhajanSingh_bat,95)
plot_add(HarbhajanSingh_bat)
Predict(HarbhajanSingh_bat)


#MAWood

MAWood_bat <- data_bat[data_bat$BATSMEN== "MAWood",] 
MAWood_bat <- col_add(MAWood_bat,95)
plot_add(MAWood_bat)
Predict(MAWood_bat)


#ImranTahir

ImranTahir_bat <- data_bat[data_bat$BATSMEN== "ImranTahir",] 
ImranTahir_bat <- col_add(ImranTahir_bat,95)
plot_add(ImranTahir_bat)
Predict(ImranTahir_bat)


#CMunro

CMunro_bat <- data_bat[data_bat$BATSMEN== "CMunro",] 
CMunro_bat <- col_add(CMunro_bat,95)
plot_add(CMunro_bat)
Predict(CMunro_bat)


#GGambhir

GGambhir_bat <- data_bat[data_bat$BATSMEN== "GGambhir",] 
GGambhir_bat <- col_add(GGambhir_bat,95)
plot_add(GGambhir_bat)
Predict(GGambhir_bat)


#SSIyer

SSIyer_bat <- data_bat[data_bat$BATSMEN== "SSIyer",] 
SSIyer_bat <- col_add(SSIyer_bat,95)
plot_add(SSIyer_bat)
Predict(SSIyer_bat)


#VShankar

VShankar_bat <- data_bat[data_bat$BATSMEN== "VShankar",] 
VShankar_bat <- col_add(VShankar_bat,95)
plot_add(VShankar_bat)
Predict(VShankar_bat)


#RRPant

RRPant_bat <- data_bat[data_bat$BATSMEN== "RRPant",] 
RRPant_bat <- col_add(RRPant_bat,95)
plot_add(RRPant_bat)
Predict(RRPant_bat)


#RTewatia

RTewatia_bat <- data_bat[data_bat$BATSMEN== "RTewatia",] 
RTewatia_bat <- col_add(RTewatia_bat,95)
plot_add(RTewatia_bat)
Predict(RTewatia_bat)


#CHMorris

CHMorris_bat <- data_bat[data_bat$BATSMEN== "CHMorris",] 
CHMorris_bat <- col_add(CHMorris_bat,95)
plot_add(CHMorris_bat)
Predict(CHMorris_bat)


#DTChristian

DTChristian_bat <- data_bat[data_bat$BATSMEN== "DTChristian",] 
DTChristian_bat <- col_add(DTChristian_bat,95)
plot_add(DTChristian_bat)
Predict(DTChristian_bat)


#KLRahul

KLRahul_bat <- data_bat[data_bat$BATSMEN== "KLRahul",] 
KLRahul_bat <- col_add(KLRahul_bat,95)
plot_add(KLRahul_bat)
Predict(KLRahul_bat)


#MAAgarwal

MAAgarwal_bat <- data_bat[data_bat$BATSMEN== "MAAgarwal",] 
MAAgarwal_bat <- col_add(MAAgarwal_bat,95)
plot_add(MAAgarwal_bat)
Predict(MAAgarwal_bat)


#YuvrajSingh

YuvrajSingh_bat <- data_bat[data_bat$BATSMEN== "YuvrajSingh",] 
YuvrajSingh_bat <- col_add(YuvrajSingh_bat,95)
plot_add(YuvrajSingh_bat)
Predict(YuvrajSingh_bat)


#KKNair

KKNair_bat <- data_bat[data_bat$BATSMEN== "KKNair",] 
KKNair_bat <- col_add(KKNair_bat,58)
plot_add(KKNair_bat)
Predict(KKNair_bat)


#DAMiller

DAMiller_bat <- data_bat[data_bat$BATSMEN== "DAMiller",] 
DAMiller_bat <- col_add(DAMiller_bat,95)
plot_add(DAMiller_bat)
Predict(DAMiller_bat)


#MPStoinis

MPStoinis_bat <- data_bat[data_bat$BATSMEN== "MPStoinis",] 
MPStoinis_bat
MPStoinis_bat <- col_add(MPStoinis_bat,12)
plot_add(MPStoinis_bat)
Predict(MPStoinis_bat)


#BBMcCullum

BBMcCullum_bat <- data_bat[data_bat$BATSMEN== "BBMcCullum",] 
BBMcCullum_bat <- col_add(BBMcCullum_bat,95)
plot_add(BBMcCullum_bat)
Predict(BBMcCullum_bat)


#QdeKock

QdeKock_bat <- data_bat[data_bat$BATSMEN== "QdeKock",] 
QdeKock_bat <- col_add(QdeKock_bat,95)
plot_add(QdeKock_bat)
Predict(QdeKock_bat)


#VKohli

VKohli_bat <- data_bat[data_bat$BATSMEN== "VKohli",] 
VKohli_bat <- col_add(VKohli_bat,95)
plot_add(VKohli_bat)
Predict(VKohli_bat)


#ABdeVilliers

ABdeVilliers_bat <- data_bat[data_bat$BATSMEN== "ABdeVilliers",] 
ABdeVilliers_bat <- col_add(ABdeVilliers_bat,95)
plot_add(ABdeVilliers_bat)
Predict(ABdeVilliers_bat)


#SNKhan

SNKhan_bat <- data_bat[data_bat$BATSMEN== "SNKhan",] 
SNKhan_bat <- col_add(SNKhan_bat,95)
plot_add(SNKhan_bat)
Predict(SNKhan_bat)


#MandeepSingh

MandeepSingh_bat <- data_bat[data_bat$BATSMEN== "MandeepSingh",] 
MandeepSingh_bat <- col_add(MandeepSingh_bat,95)
plot_add(MandeepSingh_bat)
Predict(MandeepSingh_bat)


#CRWoakes

CRWoakes_bat <- data_bat[data_bat$BATSMEN== "CRWoakes",] 
CRWoakes_bat <- col_add(CRWoakes_bat,95)
plot_add(CRWoakes_bat)
Predict(CRWoakes_bat)


#SPNarine

SPNarine_bat <- data_bat[data_bat$BATSMEN== "SPNarine",] 
SPNarine_bat <- col_add(SPNarine_bat,95)
plot_add(SPNarine_bat)
Predict(SPNarine_bat)


#CALynn

CALynn_bat <- data_bat[data_bat$BATSMEN== "CALynn",] 
CALynn_bat <- col_add(CALynn_bat,95)
plot_add(CALynn_bat)
Predict(CALynn_bat)


#RVUthappa

RVUthappa_bat <- data_bat[data_bat$BATSMEN== "RVUthappa",] 
RVUthappa_bat <- col_add(RVUthappa_bat,95)
plot_add(RVUthappa_bat)
Predict(RVUthappa_bat)


#NRana

NRana_bat <- data_bat[data_bat$BATSMEN== "NRana",] 
NRana_bat <- col_add(NRana_bat,95)
plot_add(NRana_bat)
Predict(NRana_bat)


#KDKarthik

KDKarthik_bat <- data_bat[data_bat$BATSMEN== "KDKarthik",] 
KDKarthik_bat <- col_add(KDKarthik_bat,95)
plot_add(KDKarthik_bat)
Predict(KDKarthik_bat)


#RKSingh

RKSingh_bat <- data_bat[data_bat$BATSMEN== "RKSingh",] 
RKSingh_bat
RKSingh_bat <- col_add(RKSingh_bat,95)
plot_add(RKSingh_bat)
Predict(RKSingh_bat)


#ADRussell

ADRussell_bat <- data_bat[data_bat$BATSMEN== "ADRussell",] 
ADRussell_bat <- col_add(ADRussell_bat,95)
plot_add(ADRussell_bat)
Predict(ADRussell_bat)


#RVinayKumar

RVinayKumar_bat <- data_bat[data_bat$BATSMEN== "RVinayKumar",] 
RVinayKumar_bat <- col_add(RVinayKumar_bat,95)
plot_add(RVinayKumar_bat)
Predict(RVinayKumar_bat)


#AMRahane

AMRahane_bat <- data_bat[data_bat$BATSMEN== "AMRahane",] 
AMRahane_bat <- col_add(AMRahane_bat,95)
plot_add(AMRahane_bat)
Predict(AMRahane_bat)


#DJMShort

DJMShort_bat <- data_bat[data_bat$BATSMEN== "DJMShort",] 
DJMShort_bat <- col_add(DJMShort_bat,95)
plot_add(DJMShort_bat)
Predict(DJMShort_bat)


#SVSamson

SVSamson_bat <- data_bat[data_bat$BATSMEN== "SVSamson",] 
SVSamson_bat <- col_add(SVSamson_bat,73)
plot_add(SVSamson_bat)
Predict(SVSamson_bat)
hist(SVSamson_bat[,2])
SVSamson_bat


#BAStokes

BAStokes_bat <- data_bat[data_bat$BATSMEN== "BAStokes",] 
BAStokes_bat <- col_add(BAStokes_bat,95)
plot_add(BAStokes_bat)
Predict(BAStokes_bat)

Alphabetical_names_batsmen

#JC Archer
Tripathi_bat <- data_bat[data_bat$BATSMEN== "RATripathi",] 
Predict(Tripathi_bat)

#Butler

Buttler_bat <- data_bat[data_bat$BATSMEN== "JCButtler",] 
Buttler_bat <- col_add(Buttler_bat, 34)
plot_add(Buttler_bat)
Predict(Buttler_bat)


#K Gowtham
Gowtham_bat <- data_bat[data_bat$BATSMEN== "KGowtham",] 
Predict(Gowtham_bat)

#S Gopal

Gopal_bat <- data_bat[data_bat$BATSMEN== "SGopal",] 
Predict(Gopal_bat)

#AR Patel

ARPatel_bat <- data_bat[data_bat$BATSMEN== "ARPatel",] 
Predict(ARPatel_bat)

#K Pollard

Alphabetical_names_batsmen
Pollard_bat <-  data_bat[data_bat$BATSMEN== "KAPollard",] 
Predict(Pollard_bat)

#Cutting

Cutting_bat <-  data_bat[data_bat$BATSMEN== "BCJCutting",] 
Predict(Cutting_bat)

#JP Duminy

Duminy_bat <- data_bat[data_bat$BATSMEN== "JPDuminy",] 
Predict(Duminy_bat)

#P Shaw

Shaw_bat <- data_bat[data_bat$BATSMEN== "PPShaw",]
Shaw_bat
Predict(Shaw_bat)
Alphabetical_names_batsmen

median(VShankar_bat[,2])

David <- data_bat[data_bat$BATSMEN== "JPDuminy",] 
Predict(Duminy_bat)
Alphabetical_names_batsmen


Binny_bat <- data_bat[data_bat$BATSMEN== "STRBinny",] 
Predict(Binny_bat)
