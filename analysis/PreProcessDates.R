lyrics <- read.csv("C:/Users/boudrejp/Documents/MIDS/Python/PythonProj2/data/HipHopLyrics.csv")
reps <- read.csv("C:/Users/boudrejp/Documents/MIDS/Python/PythonProj2/data/republicans2016.csv")
dems <- read.csv("C:/Users/boudrejp/Documents/MIDS/Python/PythonProj2/data/democrats2016.csv")

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
  #add zeros where necessary
  input.date.vect <- sub("^([0-9]{1})-", "0\\1-", input.date.vect)
  input.date.vect <- sub("-([0-9]{1})-", "-0\\1-", input.date.vect)
  return(input.date.vect)
}

reps$Date <- as.POSIXct(as.Date(process.dates(reps$Date), "%m-%d-%Y"))
dems$Date <- as.POSIXct(as.Date(process.dates(dems$Date), "%m-%d-%Y"))

min.clinton <- min(dems$Date[dems$Clinton != "--"])
max.clinton <- max(dems$Date[dems$Clinton != "--"])
min.bernie <- min(dems$Date[dems$Sanders != "--"])
max.bernie <- max(dems$Date[dems$Sanders != "--"])
min.trump <- min(reps$Date[reps$Trump != "--"])
max.trump <- max(reps$Date[reps$Trump != "--"])
min.cruz <- min(reps$Date[reps$Cruz != "--"])
max.cruz <- max(reps$Date[reps$Cruz != "--"])
min.kasich <- min(reps$Date[reps$Kasich != "--"])
max.kasich <- max(reps$Date[reps$Kasich != "--"])

len.clinton <- max.clinton - min.clinton
len.bernie <- max.bernie - min.bernie
len.trump <- max.trump - min.trump
len.cruz <- max.cruz - min.cruz
len.kasich <- max.kasich - min.kasich

candidate.data.frame <- data.frame(campaign.length = as.numeric(c(len.clinton, len.bernie, len.trump, len.cruz, len.kasich)))
rownames(candidate.data.frame) <- c("Clinton", "Sanders", "Trump", "Cruz", "Kasich")
# take the lyric data and add the mentions per candidate for data to create a scatterplot

candidate.data.frame$mentions <- NA
candidate.data.frame$mentions[1] <- sum(lyrics$candidate == "Hillary Clinton")
candidate.data.frame$mentions[2] <- sum(lyrics$candidate == "Bernie Sanders")
candidate.data.frame$mentions[3] <- sum(lyrics$candidate == "Donald Trump")
candidate.data.frame$mentions[4] <- sum(lyrics$candidate == "Ted Cruz")
candidate.data.frame$mentions[5] <- sum(lyrics$candidate == "John Kasich")

plot(x = candidate.data.frame$campaign.length, y = candidate.data.frame$mentions, xlab = "Candidate campaign length (days)",
     ylab = "Mentions in rap songs", pch = 18, col = "blue", ylim = c(0, 350))
text(candidate.data.frame$campaign.length, candidate.data.frame$mentions, rownames(candidate.data.frame), cex = 0.6, pos = 3, col = "red")
