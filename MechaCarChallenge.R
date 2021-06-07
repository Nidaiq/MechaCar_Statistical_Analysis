library(dplyr)

# Deliverable # 1
MechaCar_data <- read.csv('MechaCar_mpg.csv') #import dataset

lm(mpg ~ AWD + vehicle_length + vehicle_weight + spoiler_angle + ground_clearance ,data=MechaCar_data) #generate multiple linear regression model
summary(lm(mpg ~ AWD + vehicle_length + vehicle_weight + spoiler_angle + ground_clearance ,data=MechaCar_data)) #generate multiple linear regression model

# Deliverable # 2
SuspensionCoil_data <- read.csv('Suspension_Coil.csv') #import dataset
total_summary <- SuspensionCoil_data%>%summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD=sd(PSI),.groups = 'keep') #create summary table
lot_summary <- SuspensionCoil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD=sd(PSI),.groups = 'keep') #create summary table

# Deliverable 3: T-Tests on Suspension Coils
t.test(SuspensionCoil_data$PSI, mu =1500) 
#t.test(SuspensionCoil_data$PSI[SuspensionCoil_data$Manufacturing_Lot=="Lot1"], mu =1500)

#Lot1
x <-subset(SuspensionCoil_data, SuspensionCoil_data$Manufacturing_Lot == "Lot1")
t.test(x$PSI, mu=1500)

# Lot2
y <-subset(SuspensionCoil_data, SuspensionCoil_data$Manufacturing_Lot == "Lot2")
t.test(y$PSI, mu=1500)

# Lot3
z <-subset(SuspensionCoil_data, SuspensionCoil_data$Manufacturing_Lot == "Lot3")
t.test(z$PSI, mu=1500)