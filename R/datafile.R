## get data file ###
datafile<-function(){
  dr<-getwd()
  tmp<-paste(dr, "/biolab01.sqlite", sep="")
  datafile<-tmp
  datafile
}

conn<-function(){
  conn<-dbConnect(RSQLite::SQLite(), datafile())
  return(conn)
}