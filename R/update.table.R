### updata data to table ####
update.table<-function(table, data){
  conn <- conn()
  rsc<-checkmatch(table, data)
  if(identical(rsc, "FALSE")==TRUE){
    stop()
  }
  listtable<-dbListFields(conn, table)
  nfield<-length(listtable)
  valuestring<-paste(listtable[2], "= '", data[2], "'", sep = "")
  for(i in 3:nfield){
    vtem<-paste(listtable[i], "= '", data[i], "'",sep = "")
    valuestring<-paste(valuestring, vtem, sep = ", ")
  }
  swhere<-paste(listtable[1], "= '", data[1], "'", sep = "")
  sql<-paste("UPDATE ", table, " SET ",valuestring, " WHERE ", swhere, sep = "")
  rs<-dbSendQuery(conn, sql)
  dbDisconnect(conn)
  
  return(rs)
}