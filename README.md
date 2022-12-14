Greetings! The following provides descriptions of the contents of this repository along with how to make the report.

# Content of the Report

The following report will compile into an HTML document that prints out the head of the cleaned hospital dataset along with a brief description of the dataset. It also contains a summary demographic table along with Kaplan-Meier curves.

# Contents of Repository

The project repository contains the directory with the following:
  
  makefile -> for compiling the report 
  
  report.Rmd -> report R markdown
  
  README.md -> instructions
  
  .gitignore file -> removes output from git file
  
  Along with 3 subfolders:

  1) Data
    This subfolder contains both the raw CSV dataset (heart_failure_clinical_records_dataset) and the cleaned dataset created
    from the end of `01Bringing_in_dataset.R` within the Programs subfolder.
  
  2) Programs
    This subfolder contains the three programs required to render the final report.Rmd. `01Bringing_in_dataset.R` brings in the
    raw dataset and cleans it for use for summary table and Kaplan-Meier curve creation. `02CreatingProducts.R` creates the           summary table and Kaplan-Meier curves and stores them as a .rds and .jpg file respectively within the Output subfolder.           `03renderingreport.R` renders the html report from the report.rmd file.
  
  3) Output
    This subfolder contains the output at the end of `02CreatingProducts.R`, namely, the summary table and Kaplan-Meier curve. The     summary table is saved as `SummaryTable.rds` and Kaplan-Meier curve as `KaplanPlot.jpg`. This folder also contains a .gitkeep     file so that the output folder shows up on GitHub. 
    
# Creating the Report
To create the report HTML, open up a git terminal and type in `make`, or `make report.html`. 
    
# Synchronizing Packages

To synchronzize the packages of your environment to that of the project's, please take the following steps:

  1) Ensure you have `renv` package installed
  2) Ensure the working directory in your R session is the one of the cloned project directory
      Can do this via `setwd` and `getwd` commands
  3) Now restore the package library (one you DOUBLE CHECKED that you are in the right working directory) with `renv::restore()`
  4) Finally you can now ensure that the report builds by running `make` or running the contents of the code folder individually
  
# Assembling the Report

To generate the report, the Docker image corresponding to the project must be buit. To do this, you can type either into the terminal:
  1) `make build` -> Builds the image from scatch (will be time      consuming)
  2) `make pull` -> Pulls the image from Dockerhub
  
Once this is done, the report can be assembled within the container built. To do this, simply type `make project` and within the report subfolder you will find the assembled report.