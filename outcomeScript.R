# Final Assignment/Quiz
# Rob Miller

# Ingest data
outcome<-read.csv("c:/temp/outcome-of-care-measures.csv", colClasses = "character")

colCount<-ncol(outcome)

# coerce column 11 "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
# NA warning will occur, disregard for now.
outcome[,11]<-as.numeric(outcome[,11])

class(outcome)

# Print histogram of 30 Heart Attack Mortality Rates
hist(outcome[,11])
