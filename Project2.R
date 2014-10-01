# 1. Which meal is preferred by the older generation?
    #What is the percentage of voters 16-24 that prefer Cullen skink?
    #How many people prefer Partan bree?

# 2. Create data frame
city <- c("Edinburgh","Edinburgh","Glasgow","Glasgow")
age <- c("16-24","25+","16-24","25+")
voteCullen <- c(80100,143000,99400,150400)
votePartan <- c(35900,214800,43000,207000)
dataFrame <- data.frame(city,age,voteCullen,votePartan)
dataFrame

# 3. tidy the data
library(dplyr)
library(tidyr)
dataFrame %>%
  gather(key, value, starts_with("city"))

# 4. answer my questions
  # Which meal is preferred by the older generation?
Cullen25Plus <- dataFrame %>% 
  select(voteCullen) %>%
  filter(age == "25+") %>%
  summarise(sum(voteCullen))
Partan25Plus <- dataFrame %>% 
  select(votePartan) %>%
  filter(age == "25+") %>%
  summarise(sum(votePartan))
Cullen25Plus>Partan25Plus
    # Partan bree is more preferred by 25 and older
  
  # What is the percentage of voters 16-24 that prefer Cullen skink?
Cullen1624 <- dataFrame %>% 
  select(voteCullen) %>%
  filter(age == "16-24") %>%
  summarise(sum(voteCullen))
totalCullenVotes <- summarise(dataFrame, total = sum(voteCullen))
answer2 <- Cullen1624 / totalCullenVotes
answer2
    # Around 38% of the 16-24 year olds preferred Cullen skink.

  # How many people prefer Partan bree?
totalPartanVotes <- summarise(dataFrame, total = sum(votePartan))
totalPartanVotes
    # 500,700 people in the study prefer Partan bree.

# 5. I think dividing the values so that the Yes votes and the No votes 
    #were each their own column. I think that made it easier to work with 
    #the data. I think my questions were straightfoward with straightfoward 
    #methods of getting the answers.