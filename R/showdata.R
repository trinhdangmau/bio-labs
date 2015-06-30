### show data from table
showdata<-function(table, fields = ""){
  conn<-conn()
  sql<-ifelse(nchar(fields)==0, paste("select * from ", table, sep = ""), 
              paste("select ", fields, " from ", table, sep = ""))
  #sql<-paste("select ", sl," from ", table, sep = "")
  rs<-dbGetQuery(conn, sql)
  dbDisconnect(conn)
  
  return(rs)
}