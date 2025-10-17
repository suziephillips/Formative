## Formative Project, Health Data Science

#Suzie Phillips, October 2025

# do not need to set working directory if R code is run within linux terminal

# I will create the output using Rstudio exclusively, so I will create a WD and read in the data using this

setwd("//wsl.localhost/Ubuntu/home/suziephillips/HDS/formative")

# read in BMX data and list of accel IDs data

accel_IDs <- read.table('data/derived/accel/accel_ids.txt', header=F, col.names='ID')
BMX_data <- read.csv('data/original/BMX_D.csv')

#make indicator for accel dataset
accel_IDs$accel <- 1

#make indicator for BMX dataset
BMX_data$BMX <- 1

#full join merge, where SEQN=ID
full_cohort <- merge(BMX_data, accel_IDs, by.x='SEQN', by.y='ID', all.x=T, all.y=T)

table(full_cohort$accel) #7455 pts with accel data
table(full_cohort$BMX) #9950 pts with BMX data
table(full_cohort$accel,full_cohort$BMX) #7455 pts in both datasets

#create final cohort with only participants which both data
cohort <- subset(full_cohort, BMX == 1 & accel == 1)

#export to csv
write.csv(cohort, "data/derived/cohort.csv")




