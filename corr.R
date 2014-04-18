corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # Set files and correlation matrices
  files <- dir(directory)
  corr_data <- numeric(0)
  
  for (i in seq_along(files)) {
    # Assign number of complete obs in table to variable to check against threshold.
    obs <- complete(directory, i)$nobs
    
    # Check amount of completed obs in table against threshold
    if (obs > threshold) {
      
      # Open file
      doc <- files[i]
      path <- paste(directory, doc, sep="/")
      data <- read.csv(path, header=TRUE)
      
      # Determine correlation between sulfate and nitrate
      corr_entry <- cor(data$sulfate, data$nitrate, use="complete.obs")
      
      # Add correlation figure to correlation vector.
      corr_data <- c(corr_data, corr_entry)
    }
    
  }
  
  return(corr_data)
  
}
