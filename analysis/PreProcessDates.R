library(ggplot2)
library(dpylr)

lyrics <- read.csv("C:/Users/johnb/Documents/MIDS/W200_Python/PythonProj2/data/HipHopLyrics.csv")
reps <- read.csv("C:/Users/johnb/Documents/MIDS/W200_Python/PythonProj2/data/republicans2016.csv")
dems <- read.csv("C:/Users/johnb/Documents/MIDS/W200_Python/PythonProj2/data/democrats2016.csv")

# need to add years to reps, dems
# let's go ahead and just use the back date here... makes sense for our data (?)

process.dates <- function(input.date.vect){
  input.date.vect <- gsub(".{3,} - ", "", input.date.vect)
  current.month <- rep(NA, length(input.date.vect))
  #need to add years to the vector
  current.year <- 2016
  #identify month
  for(i in 1:length(input.date.vect)){
    #if the second character is a slash, then the month is one digit. else, two
    second.char <- substr(input.date.vect[i], 2, 2)
    if(second.char == "/"){
      current.month[i] = substr(input.date.vect[i], 1, 1)
    } else {
      current.month[i] = substr(input.date.vect[i], 1, 2)
    }
    # if the month of the previous entry is greater, then knock down the year one
    if(i > 1){
      if(current.month[i] > current.month[i - 1]){
        current.year <- current.year - 1
      }
    }
    input.date.vect[i] = paste0(input.date.vect[i], "/", current.year)
  }
  input.date.vect <- gsub("/", "-", input.date.vect)
  return(input.date.vect)
}

reps$Date <- as.POSIXct(process.dates(reps$Date), tz = "UTC", format = "%m-%d-&Y")
dems$Date <- as.POSIXct(process.dates(dems$Date), tz = "UTC", format = "%m-%d-&Y")

min.clinton <- min(dems$Date[!is.na(dems$Clinton)])
max.clinton <- max(dems$Date[!is.na(dems$Clinton)])
min.bernie <- min(dems$Date[!is.na(dems$Sanders)])
max.bernie <- min(dems$Date[!is.na(dems$Sanders)])
min.trump <- min(reps$Date)[!is.na(reps$Trump)]
max.trump <- max(reps$Date)[!is.na(reps$Trump)]
min.cruz <- min(reps$Date)[!is.na(reps$Cruz)]
max.cruz <- max(reps$Date)[!is.na(reps$Cruz)]
min.kasich <- min(reps$Date)[!is.na(reps$Kasich)]
max.kasich <- max(reps$Date)[!is.na(reps$Kasich)]

len.clinton <- max.clinton - min.clinton
len.bernie <- max.bernie - min.bernie
len.trump <- max.trump - min.trump
len.cruz <- max.cruz - min.cruz
len.kasich <- max.kasich - min.kasich

