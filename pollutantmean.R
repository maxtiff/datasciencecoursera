pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  files <- dir(directory)
  
  sum <- 0.0
  obs <- 0
  
  for (i in id) {
    
    doc <- files[i]
    path <- paste(directory, doc, sep="/")
    data <- read.csv(path)
    
    pollutant_subset = data[pollutant]
    drop <- is.na(pollutant_subset)
    keep <- pollutant_subset[!drop]
    sum <- sum + sum(keep)
    obs <- obs + length(keep)
    
  }
  
avg <- sum/obs
return(avg)

}

