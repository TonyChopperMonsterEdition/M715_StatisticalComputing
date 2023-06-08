controlNumber1 = 0
controlNumber2 = 0
controlNumber3 = 0
controlNumber4 = 0
controlNumber5 = 0
controlNumber6 = 0

rowAllYears1= 0
rowAllYears2= 0
rowAllYears3= 0
rowAllYears4= 0
rowAllYears5= 0
rowAllYears6= 0

for(i in 15:21){
  assign(ozon_Var[i-14],add_column(get(paste0("ozone_20",i)), Year=2000+i, .before="Stationscode"))
  assign(pm10mu_Var[i-14],add_column(get(paste0("pm10mu_20",i)), Year=2000+i, .before="Stationscode"))
  assign(pm2500nm_Var[i-14], add_column(get(paste0("pm2500nm_20",i)), Year=2000+i, .before="Stationscode"))
  assign(nitrogendioxid_Var[i-14],add_column(get(paste0("NO2_20",i)), Year=2000+i, .before="Stationscode"))
  
  controlNumber1= controlNumber1+ nrow(get(paste0("ozone_20",i)))
  controlNumber2= controlNumber2+ nrow(get(paste0("pm10mu_20",i)))
  controlNumber3= controlNumber3+ nrow(get(paste0("pm2500nm_20",i)))
  controlNumber4= controlNumber4+ nrow(get(paste0("NO2_20",i)))
}

for(i in 15:20){
  assign(so2_Var[i-14],add_column(get(paste0("so2_20",i)), Year=2000+i, .before="Stationscode"))
  assign(benz_Var[i-14],add_column(get(paste0("benz_20",i)), Year=2000+i, .before="Stationscode"))

  controlNumber5= controlNumber5+ nrow(get(paste0("so2_20",i)))
  controlNumber6= controlNumber6+ nrow(get(paste0("benz_20",i)))
}

for(i in 1:length(ozon_Var)){
  
  if(!(exists("allYears_ozon_Var"))){
    allYears_ozon_Var<-get(paste0("ozone_20",i+14))
    allYears_pm10mu_Var <-get(paste0("pm10mu_20",i+14))
    allYears_pm2500nm_Var <-get(paste0("pm2500nm_20",i+14))
    allYears_nitrogendioxid_Var <-get(paste0("NO2_20",i+14))
    
  } else
  {
    allYears_ozon_Var <- rbind(allYears_ozon_Var,get(paste0("ozone_20",i+14)))
    allYears_pm10mu_Var<-rbind(allYears_pm10mu_Var,get(paste0("pm10mu_20",i+14)))
    allYears_pm2500nm_Var<- rbind(allYears_pm2500nm_Var, get(paste0("pm2500nm_20",i+14)))
    allYears_nitrogendioxid_Var<- rbind(allYears_nitrogendioxid_Var, get(paste0("NO2_20",i+14)))
  }

}

for(i in 1:length(benz_Var)){
  
  if(!(exists("allYears_benz_Var"))){
    allYears_so2_Var<-get(paste0("so2_20",i+14))
    allYears_benz_Var <-get(paste0("benz_20",i+14))
    
  } else
  {
    allYears_so2_Var <- rbind(allYears_so2_Var,get(paste0("so2_20",i+14)))
    allYears_benz_Var<-rbind(allYears_benz_Var,get(paste0("benz_20",i+14)))

  }
  
}

rowAllYears1=nrow(allYears_ozon_Var)
rowAllYears2=nrow(allYears_pm10mu_Var)
rowAllYears3=nrow(allYears_pm2500nm_Var)
rowAllYears4=nrow(allYears_nitrogendioxid_Var)
rowAllYears5=nrow(allYears_so2_Var)
rowAllYears6=nrow(allYears_benz_Var)

### Must be true
print(rowAllYears1==controlNumber1)
print(rowAllYears2==controlNumber2)
print(rowAllYears3==controlNumber3)
print(rowAllYears4==controlNumber4)
print(rowAllYears5==controlNumber5)
print(rowAllYears6==controlNumber6)