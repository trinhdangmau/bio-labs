#### get id key with condition ##
getidkey<-function(tablename, condition){
  conn <- conn()
  keycolumn<-index.column(tablename)
  sql<-paste("select ", keycolumn, " from ", tablename, " where ", condition, sep = "")
  idkey<- dbGetQuery(conn, sql)
  dbDisconnect(conn)
  return(idkey[1,1])
}