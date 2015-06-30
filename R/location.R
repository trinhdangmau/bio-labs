#### add special for location ###
location.new<-function(id = "auto", id_proj, name, type = "", coordinate = "", 
                       wards = "", city = "", province = "", country = "", describe = ""){
  insert.table("location", data = c(id, id_proj, name, type, coordinate, wards, city, province, country, describe))
  cat("New location added!")
}

### edit location information ##
location.edit<-function(id, id_proj = "", name = "", type = "", coordinate = "", 
                        wards = "", city = "", province = "", country = "", describe = ""){
  conn<-conn()
  
  rs<- dbGetQuery(conn, sql_idtabel("location", id))
  if(nchar(id_proj==0)) id_proj<-rs["id_proj_loca"][1,1]
  if (nchar(name)==0) name<-rs["name_loca"][1,1]
  if (nchar(type)==0) type<-rs["type_loca"][1,1]
  if(nchar(coordinate)==0) coordinate <- rs["coordinate_loca"][1,1]
  if(nchar(wards)==0) wards<-rs["wards_loca"][1,1]
  if(nchar(city)==0) city<-rs["city_loca"][1,1]
  if(nchar(province)==0) province<-rs["province_loca"][1,1]
  if(nchar(country)==0) country<-rs["country_loca"][1,1]
  if(nchar(describe)==0) describe<-rs["describe_loca"][1,1]
  update.table("location", data = c(id, id_proj, name, type, coordinate, wards, city, province, country, describe))
  
  dbDisconnect(conn)
}

### delete from location ###
location.delete <- function(id){
  delete.table("location", id)
}

### View location
location.view<-function(id = T, id_proj = T, name = T, type = F, coordinate = F,
                        wards = F, city = F, province = F, country = F, describe = F){
  if (identical(id, TRUE)==TRUE) fields<-"id_loca"
  if (identical(id_proj, TRUE)==TRUE) fields<-paste(fields, "id_proj_loca", sep = ",")
  if (identical(name, TRUE)==TRUE) fields<-paste(fields, "name_loca", sep = ",")
  if(identical(type, TRUE)==TRUE) fields<-paste(fields, "type_loca", sep = ",")
  if(identical(coordinate, TRUE)==TRUE) fields<-paste(fields, "coordinate_loca", sep = ",")
  if(identical(wards, TRUE)==TRUE) fields<-paste(fields, "wards_loca", sep = ",")
  if(identical(city, TRUE)==TRUE) fields<-paste(fields, "city_loca", sep = ",")
  if(identical(province, TRUE)==TRUE) fields<-paste(fields, "province_loca", sep = ",")
  if(identical(country, TRUE)==TRUE) fields<-paste(fields, "country_loca", sep = ",")
  if(identical(describe, TRUE)==TRUE) fields<-paste(fields, "describe_loca", sep = ",")
  showdata("location", fields)
}