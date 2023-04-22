# clear the workspace
rm(list=ls()) 
#setwd("~/")
getwd()

#work_dir <- "/Users/gorkem.er/Documents/GitHub/IAR_S22_round2"
#setwd(work_dir)

# change txt to csv
#tab <- read.table("ImageDB/Oct_images/imageDB_10-3-22.txt", sep = ',')#read.delim("ImageDB/Oct_images/imageDB_10-3-22.txt", comment="", header=TRUE) file.choose()
#write.csv(tab, "imageDB_10-3-22.csv", row.names=FALSE, quote=FALSE)

df = read.csv('names.csv', header = TRUE) #('ImageDB/imageDB_5-2-2022.csv', header=TRUE)
names <- df$Names
types <- df$types[!(df$types == "")]
types
nTrials = 20
#create data frame with nTrials rows and 2 columns
trial_df <- data.frame(matrix(ncol = 2, nrow = nTrials))
#provide column names
colnames(trial_df) <- c('Names', 'Types')
trial_matrix <- matrix(ncol = 12, nrow = nTrials)
for (i in 1:nTrials){
  # select random 6
  print(i)
  print(sample(names, 6, replace=FALSE))
  print(sample(types, 6, replace=FALSE))
  trial_matrix[i,1:6] <- c(sample(names, 6, replace=FALSE))
  trial_matrix[i,7:12] <- c(sample(types, 6, replace=FALSE))
}
# this is for set size 6 
trial_df_set6 <- data.frame(trial_matrix)
# renaming
trial_df_set6
write.csv(trial_df_set6, file = 'trial_df_set6.csv')
  
  
  
#thingsConcept <- read.table(file = 'things_concepts.tsv', fill=TRUE, sep = '\t', header = TRUE)
imagePaths = read.csv('images_2-23-23/imageDB_02-23-23.csv', header = TRUE) #('ImageDB/imageDB_5-2-2022.csv', header=TRUE)
imagePaths$subFolder <- "images_2-23-23/"
imagePaths$pathGE <- paste(imagePaths$subFolder,imagePaths$ImageID,sep="")
#get only the pilot images
imagePaths.pilot <- subset(imagePaths, imagePaths$ForPilot==0) # Feb02: 0 not 1 because
# this set includes the test images only anyway. 

#6 May, pilot 1 olan bir foto var onu da include ediyorum
imagePaths.pilot <- imagePaths
write.csv(imagePaths.pilot, file = 'imagePaths.pilot.csv')
# https://csvjson.com/
### add slider questions to each of the row ###
sliderQuestions = read.csv('sliderQuestions.csv', header=TRUE)



#import the list to json
library(rjson)
imagePathsPilot <- toJSON(imagePaths.pilot, indent=0, method="C" )#pretty= TRUE
imagePathsPilot
#write json
write(imagePathsPilot, "imagePathsPilot.json")







