#devtools::install_github('shinyapps', 'rstudio')

#shinyapps::setAccountInfo(name='dkmckinney', 
#                          token='2382F5619BCE87C06A0A9399506425EA', 
#                          secret='/UhSqO+rTI49BZ2JiH+XkGEbmEW7I4KuZUV4L9aG')


rm(list=ls())
options(digits=4, width=120)

if (file.exists("c:/windows/win.ini")) {
  setwd("w:/mooc/Developing Data Products/project") 
} else setwd("/home/derec/mnt/project/mooc/Developing Data Products/project")

library(shiny)



# Codebook for HSB2 Dataset
# 
# 1   id 	    ID number 	                3-digit number
# 2 	female 	Female 	                    0=male 1=female
# 3 	race 	Race or Ethnicity 	        1=hispanic 2=asian 3=black 4=white
# 4 	ses 	Socioeconomic status 	    1=low 2=medium 3=high
# 5 	sctyp 	School type 	            1=public 2=private
# 6 	prog 	High school program 	    1=general 2=academic prepartory 3=vocational/technical
# 7 	read 	Standardized reading score 	(mean = 50 and sd = 10)
# 8 	write 	Standardized writing score 	(mean = 50 and sd = 10)
# 9 	math 	Standardized math score 	(mean = 50 and sd = 10)
# 10 	science Standardized science score 	(mean = 50 and sd = 10)
# 11 	socst 	Standardized soc st score 	(mean = 50 and sd = 10)

# select subset
library(sqldf)
data <- read.csv("hsb2.csv")
sql <- paste("select read,write,math,science,socst from data",sep=" ")
ret <- sqldf(sql)
head(ret)

# plot histograms
par(mfrow = c(3, 2))
color <- "lightblue"
color2 <- "red"
hist(ret$read,col=color,main="Reading Score",xlab="Score (standardized)")
abline(v=median(ret$read),col=color2)
hist(ret$write,col=color,main="Writing Score",xlab="Score (standardized)")
abline(v=median(ret$write),col=color2)
hist(ret$math,col=color,main="Math Score",xlab="Score (standardized)")
abline(v=median(ret$math),col=color2)
hist(ret$science,col=color,main="Science Score",xlab="Score (standardized)")
abline(v=median(ret$science),col=color2)
hist(ret$socst,col=color,main="Social Studies Score",xlab="Score (standardized)")
abline(v=median(ret$socst),col=color2)
par(mfrow = c(1, 1))
