#Telling R where the program is located
here::i_am("Programs/01Bringing_in_dataset.R")

#Bringing in the data set from the project directory
df<-read.csv(file=here::here("Data/heart_failure_clinical_records_dataset.csv"), header = TRUE)

library(dplyr)

#Creating new dataframe with better labels
df1<-rename(df, `Age (years)` = age, Sex = sex, `Smoker Status` = smoking, 
            `Ejection Fraction (%)` = ejection_fraction, 
            `Serum Creatinine Levels (mg/dL)` = serum_creatinine, 
            `High Blood Pressure Status` = high_blood_pressure, 
            `Follow-Up Time (days)` = time, 
            `Platelet Count (kiloplatelets/mL)` = platelets, 
            `Creatinine Phosphokinase Levels (mcg/L)` =  creatinine_phosphokinase,
            `Presence of Anaemia` = anaemia, 
            `Serum Sodium Levels (mEq/L)` = serum_sodium, 
            `Diabetes Indicator` = diabetes, `Death Occured` = DEATH_EVENT, 
            Diabetes = diabetes)

#Changing Diabetes indicato variable to contain strings rather than boolean operators
df1$`Diabetes Indicator`[df$diabetes == 0] = "No Diabetes"
df1$`Diabetes Indicator`[df$diabetes == 1] = "Diabetes"

#Saving the resulting dataframe into the output folder
saveRDS(
  df1,
  file = here::here("Data", "cleandataframe.rds") 
)
