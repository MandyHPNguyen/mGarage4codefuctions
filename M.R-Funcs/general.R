# Auto Load and Check Availability of Packages ----
loadpkg_Rtools <- function(c.packages) {
  
  if (!require("pkgbuild")) install.packages("pkgbuild"); library(pkgbuild)
  if (!require("installr")) install.packages("installr"); library(installr)
  
  # Check if sys has Rtools
  
  if (has_rtools() == FALSE) {
    
    # Src: https://rdrr.io/cran/installr/man/install.Rtools.html
    
    print("You do not have the Rtools required for this function!")
    
    checkR.ans <- readline(prompt = "Would you like me to automatically download the lastest compatible version of Rtools and launch the installation for you? (yes/no): ")
    
    if (checkR.ans == "yes") {
      print("Ok!! I will initiate it!")
      print("If it does not work or you would like to do it manually, follow the instruction from the following site:")
      print("https://cran.r-project.org/bin/windows/Rtools/")
      install.Rtools()
      write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)
    } else {
      print("Great!! You have succesfully installed Rtools!!")
      print("NOW, please restart your IDE and try to call this function again!")
    }
    
  } else {
    
    print("You already have installed Rtools!")
    checkR.ans <- readline(prompt = "Would you like to re-install the lastes version? (yes/no): ")
    
    if (checkR.ans == "yes") {
      print("Great! I'm on it!")
      print("If it does not work or you would like to do it manually, follow the instruction from the following site:")
      print("https://cran.r-project.org/bin/windows/Rtools/")
      install.Rtools(check = F)
      write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)
      print("Great!! You have succesfully installed the lastes version of Rtools!!")
      print("NOW, please restart your IDE and try to call this function again!")
    } else {
      write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)
      print("Great!! I will load your packages to library!!")
    }
  }

  # Install and load the requested packages
  
  pkgs <- c.packages
  ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
      install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
  }
  
  cat("Imported Packages Check:\n")
  ipak(pkgs)
  # suppressWarnings(ipak(pkgs))
  print(">>> Thank you for using a function of Mandy HP Nguyen! <<<")
}

# Auto Load and Check Availability of Packages without asking for Rtools ----
loadpkg <- function(c.packages) {
  
  # Install and load the requested packages
  
  pkgs <- c.packages
  ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
      install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
  }
  cat("Imported Packages Check:\n")
  ipak(pkgs)
  # suppressWarnings(ipak(pkgs))
  print(">>> Thank you for using a function of Mandy HP Nguyen! <<<")
}



# Clean R Environment
cleanR <- function() {
  cat("\014")
  print("Before Clean UP:")
  print(gc()) #free up memory and report the memory usage.
  if (!require("pacman")) install.packages("pacman"); library(pacman)
  suppressMessages(pacman::p_unload(pacman::p_loaded(), character.only = TRUE))
  rm(list = ls(all.names = TRUE))
  print("After Clean UP:")
  print(gc()) #free up memory and report the memory usage.
  print(">>> Thank you for using a function of Mandy HP Nguyen! <<<")
}
a <- c(1, 2, 3)
