### insert data to table ###
insert.table <-function(table, data){
  conn <- conn()
  rsc<-checkmatch(table, data)
  if(identical(rsc, "FALSE")==TRUE){
    stop()
  }

  nfield<-length(dbListFields(conn, table))
  valuestring<-data[1]
  ###auto key
  if(identical(data[1], "auto")==TRUE){
    valuestring<-autokey(table)
  }
  ### prepare data list
  for(i in 2:nfield){
    valuestring<-paste(valuestring, data[i], sep = "', '")
  }
  sql<-paste("insert into ", table, " values ('",valuestring, "')", sep = "")
  rs<-dbSendQuery(conn, sql)
  dbDisconnect(conn)
  
  return(rs)
}