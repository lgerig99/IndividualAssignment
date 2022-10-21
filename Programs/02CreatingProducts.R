#gtsummary and dplyr packages will be used for table creation and piping
library(gtsummary)
library(dplyr)
#Survival package will be used for Kaplan-Meier curve and estimate creation
library(survival)

#Telling R what part of the project directory we are in
here::i_am("Programs/02CreatingProducts.R")

#Loading in the required dataset
df1<-readRDS(file=(here::here("Data/cleandataframe.rds")))

#Generating the first table
table_one <- df1 |>
  #Selecting desired variables
  select("Age (years)", "Sex", "Smoker Status", "Ejection Fraction (%)", 
         "Follow-Up Time (days)", "Platelet Count (kiloplatelets/mL)", 
         "Serum Creatinine Levels (mg/dL)", "High Blood Pressure Status", 
         "Creatinine Phosphokinase Levels (mcg/L)", "Presence of Anaemia", 
         "Serum Sodium Levels (mEq/L)", "Diabetes Indicator") |>
  #Grouping columns by diabetes presence
  tbl_summary(by = `Diabetes Indicator`) |>
  #Add a overall column
  add_overall() |>
  #Add p-values to compare the two cohorts
  add_p()

#Now creating a modified table that contains desired attributes
modified_table1 <- table_one |>
  #Adding cleaner labels
  modify_header(label = "**Variable**", p.value = "**P-value**") |>
  #Adding table header
  modify_caption("Baseline Demographics (N = {N})")

#Saving table to output folder
saveRDS(modified_table1, file = here::here("Output", "SummaryTable.rds"))

#Creating kaplan-Meier estimate between the two groups with log-log confidence intervals
fit.log<- survfit(Surv(`Follow-Up Time (days)`, `Death Occured`) ~ Diabetes, 
                  data=df1, conf.type="log-log")

#Now plotting the Kaplan-Meier curves

#Using jpeg function to create kaplan plot and send it to the output file
jpeg("Output/kaplanplot.jpg")
plot(fit.log,lty=c(2,1),
     #Creating labels for the x-axis, y-axis, and main figure
     xlab = "Time from follow up (Days)", ylab = "Survival probability",
     main = "Survival Distribution from Heart Failure Following Admission")

#Creating a legend for readability
legend("bottomright", legend=c("Cohort Without Diabetes","Cohort With Diabetes"),
       lty=c(2,1))

#Closing off the 
dev.off()




