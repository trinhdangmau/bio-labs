### delete all from table ##
deleteall.tbl<-function(tablename){
  conn <- conn()
  sql<-paste("DELETE FROM ", tablename, sep = "")
  dbGetQuery(conn, sql)
  cat("All data from table : ", tablename, " were deleted!")
  dbDisconnect(conn)
}