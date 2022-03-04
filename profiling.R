# profvis


rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L



install.packages("profvis")
library(profvis)

install.packages("dlnm")
library(dlnm)


data("chicagoNMMAPS")

datafr <- chicagoNMMAPS
threshold <- 27



# profiling


profvis({
  highest_temp <- c()
  record_temp <- c()
  for(i in 1:nrow(datafr)){
    highest_temp <- max(highest_temp, datafr$temp[i])
    record_temp[i] <- datafr$temp[i] >= threshold & 
      datafr$temp[i] >= highest_temp
  }
  datafr <- cbind(datafr, record_temp)
})
