setwd("C:\\Users\\lenovo\\Downloads\\训练题")
install.packages("openxlsx")
install.packages("dplyr")
library("openxlsx")
library("dplyr")
data=read.xlsx("data2.xlsx")
data_correct=na.omit(data)

for(i in length(data$Group1)){
  
}
"." %in% unlist(strsplit(data$Group1, ""))
data_correct=data["." %in% unlist(strsplit(data$Group1, "")),]
"." %in% unlist(strsplit(data$Group1[1], ""))
