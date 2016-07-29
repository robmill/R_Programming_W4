




## function best takes two arguments:
## 1. Two character abbreviation for state
## 2. Outcome Name
best<- function(state, outcome){
        outcome_raw<-read.csv("c:/temp/outcome-of-care-measures.csv", 
                          colClasses = "character") 
        names(outcome_raw)[11]<-"heart attack"
        names(outcome_raw)[17]<-"heart failure"
        names(outcome_raw)[23]<-"pneumonia"
        
        #outcome_raw[,11]<-as.numeric(outcome_raw[,11])
        #outcome_raw[,17]<-as.numeric(outcome_raw[,17])
        #outcome_raw[,23]<-as.numeric(outcome_raw[,23])
        
        state<-toupper(state)
        outcome<-tolower(outcome)
        
        outcomeCats<-c("heart attack","heart failure","pneumonia")

        
        stateAbbrev<-unique(outcome_raw$State)
        
        bool1<-FALSE
        for (i in 1:length(stateAbbrev)) {
                if (toupper(state)==stateAbbrev[i]) {
                        bool1<-TRUE
                }
        }
        if(bool1==FALSE){
                stop("invalid state")
        }
        
        bool2<-FALSE
        for(i in 1:length(outcomeCats))
                if (tolower(outcome)==outcomeCats[i]) {
                        bool2<-TRUE
                }
        if(bool2==FALSE){
                stop("invalid outcome")
        }
        
        
        # subset based on state
        outcome_sub<-subset(outcome_raw,State==state)
       
        # reduce columns to hospital name and outcome
        outcome_hosp_temp<-outcome_sub[,"Hospital.Name"]
        outcome_out_temp<-outcome_sub[,outcome]
        
        outcome_sub<-cbind(outcome_hosp_temp,outcome_out_temp)
        
        
        outcome_sub<-as.data.frame(outcome_sub)
        
        # rename columns
        names(outcome_sub)<-c("Hospital","Outcome")
        
        # remove "Not Available" values
        outcome_sub<-subset(outcome_sub,Outcome!="Not Available")
        
        # coerce outcome column to numeric
        outcome_sub[,"Outcome"]<-as.numeric(as.character(outcome_sub[,"Outcome"]))
        #outcome_sub
        outcome_sub<-outcome_sub[order(outcome_sub[,"Outcome"],
                                       outcome_sub[,"Hospital"]),]
        #outcome_sub
        # Coerce Hospital column and assign to output
        output<-as.character(outcome_sub[,"Hospital"])
        # Return the top Hospital
        output[1]
                
                
        
        
}