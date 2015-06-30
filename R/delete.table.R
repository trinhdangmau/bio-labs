### Delete data from table ####
delete.table<-function(tablename, data_compare){
  conn <- conn()
  rs<- dbGetQuery(conn, sql_idtabel(tablename, data_compare))
  if(nrow(rs)==0){
    stop("The ID was not exist!\nPlease make sure the ID is corrected!")
  }
  
  sql<-paste("DELETE FROM ", tablename," WHERE ", index.column(tablename) ,"= '", data_compare, "'", sep = "")
  dbGetQuery(conn, sql)
  cat(data_compare, " from table : ", tablename, " was deleted!")
  
  dbDisconnect(conn)
}