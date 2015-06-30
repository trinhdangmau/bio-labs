#### add special for project ###
project.new<-function(id = "auto", name, author = "", time = "", description = ""){
  insert.table("project", data = c(id, name, author, time, description))
  cat("New project added!")
}

### edit project information ##
project.edit<-function(id , name = "", author = "", time = "", description = ""){
  conn<-conn()
  
  rs<- dbGetQuery(conn, sql_idtabel("project", id))
  if (nchar(name)==0) name<-rs["name_proj"][1,1]
  if (nchar(author)==0) author<-rs["author_proj"][1,1]
  if(nchar(time)==0) time <- rs["time_proj"][1,1]
  if(nchar(description)==0) description<-rs["description_proj"][1,1]
  update.table("project", data = c(id, name, author, time, description))
  
  dbDisconnect(conn)
}

### delete from project ###
project.delete <- function(id){
  delete.table("project", id)
}

### View project
project.view<-function(id = T, name = T, author = F, time = F, description = F){
  if (identical(id, TRUE)==TRUE) fields<-"id_proj"
  if (identical(name, TRUE)==TRUE) fields<-paste(fields, "name_proj", sep = ",")
  if (identical(author, TRUE)==TRUE) fields<-paste(fields, "author_proj", sep = ",")
  if(identical(time, TRUE)==TRUE) fields<-paste(fields, "time_proj", sep = ",")
  if(identical(description, TRUE)==TRUE) fields<-paste(fields, "description_proj", sep = ",")
  
  showdata("project", fields)
}