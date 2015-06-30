#### add special for locality ###
locality.new<-function(id = "auto", id_location, name, type = "", date = "", 
                       coordinate = "", describe = ""){
  insert.table("locality", data = c(id, id_location, name, type, date, coordinate, describe))
  cat("New locality added!")
}

### edit locality information ##
locality.edit<-function(id, id_location = "", name, type = "", date = "", 
                        coordinate = "", describe = ""){
  conn<-conn()
  
  rs<- dbGetQuery(conn, sql_idtabel("locality", id))
  if(nchar(id_location==0)) id_location<-rs["id_loca_loty"][1,1]
  if (nchar(name)==0) name<-rs["name_loty"][1,1]
  if (nchar(type)==0) type<-rs["type_loty"][1,1]
  if(nchar(date)==0) date<-rs["type_loty"][1,1]
  if(nchar(coordinate)==0) coordinate <- rs["coordinate_loty"][1,1]
  if(nchar(describe)==0) describe<-rs["describe_loty"][1,1]
  update.table("locality", data = c(id, id_location, name, type, date, coordinate, describe))
  
  dbDisconnect(conn)
}

### delete from locality ###
locality.delete <- function(id){
  delete.table("locality", id)
}

### View locality
locality.view<-function(id = T, id_location = T, name = T, type = F, date = F,
                        coordinate = F, describe = F){
  if (identical(id, TRUE)==TRUE) fields<-"id_loty"
  if (identical(id_location, TRUE)==TRUE) fields<-paste(fields, "id_loca_loty", sep = ",")
  if (identical(name, TRUE)==TRUE) fields<-paste(fields, "name_loty", sep = ",")
  if(identical(type, TRUE)==TRUE) fields<-paste(fields, "type_loty", sep = ",")
  if(identical(date, TRUE)==TRUE) fields<-paste(fields, "date_loty", sep = ",")
  if(identical(coordinate, TRUE)==TRUE) fields<-paste(fields, "coordinate_loty", sep = ",")
  if(identical(describe, TRUE)==TRUE) fields<-paste(fields, "describe_loty", sep = ",")
  showdata("locality", fields)
}