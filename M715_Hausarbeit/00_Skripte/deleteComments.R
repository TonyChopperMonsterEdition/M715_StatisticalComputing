CheckSum1=0
CheckSum2=0
CheckSum3=0
CheckSum4=0
CheckSum5=0
CheckSum6=0

Result1=0
Result2=0
Result3=0
Result4=0
Result5=0
Result6=0

for(i in 15:21){
  CheckSum1= CheckSum1 + nrow(get(paste0("ozone_20",i)))
  CheckSum2= CheckSum2 + nrow(get(paste0("pm10mu_20",i)))
  CheckSum3= CheckSum3 + nrow(get(paste0("pm2500nm_20",i)))
  CheckSum4= CheckSum4 + nrow(get(paste0("NO2_20",i)))
}
for(i in 15:20){
  CheckSum5= CheckSum5 + nrow(get(paste0("so2_20",i)))
  CheckSum6= CheckSum6 + nrow(get(paste0("benz_20",i)))
}
print("Anfang")
### Deletion of comments in Tibbles
for(i in 15:21){
  assign(ozon_Var[i-14], get(paste0("ozone_20",i))[!apply(get(paste0("ozone_20",i))["Stationscode"] == "NA", 1, is.na),])
  assign(pm10mu_Var[i-14], get(paste0("pm10mu_20",i))[!apply(get(paste0("pm10mu_20",i))["Stationscode"] == "NA", 1, is.na),])
  assign(pm2500nm_Var[i-14], get(paste0("pm2500nm_20",i))[!apply(get(paste0("pm2500nm_20",i))["Stationscode"] == "NA", 1, is.na),])
  assign(nitrogendioxid_Var[i-14],get(paste0("NO2_20",i))[!apply(get(paste0("NO2_20",i))["Stationscode"] == "NA", 1, is.na),])
}

for(i in 15:20){
  assign(so2_Var[i-14], get(paste0("so2_20",i))[!apply(get(paste0("so2_20",i))["Stationscode"] == "NA", 1, is.na),])
  assign(benz_Var[i-14], get(paste0("benz_20",i))[!apply(get(paste0("benz_20",i))["Stationscode"] == "NA", 1, is.na),])
}
print("Ende")
for(i in 15:21){
  Result1= Result1 + nrow(get(paste0("ozone_20",i)))
  Result2= Result2 + nrow(get(paste0("pm10mu_20",i)))
  Result3= Result3 + nrow(get(paste0("pm2500nm_20",i)))
  Result4= Result4 + nrow(get(paste0("NO2_20",i)))
}

for(i in 15:20){
  Result5= Result5 + nrow(get(paste0("so2_20",i)))
  Result6= Result6 + nrow(get(paste0("benz_20",i)))
}

## Checks if a reduction of rows took place
print(CheckSum1>Result1)
print(CheckSum2>Result2)
print(CheckSum3>Result3)
print(CheckSum4>Result4)
print(CheckSum5>Result5)
print(CheckSum6>Result6)