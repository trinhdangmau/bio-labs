### auto generate id key ####
autokey<-function(tablename){
  conn <- conn()
  tblist<-dbListTables(conn)
  method<-match.arg(tablename, tblist)
  #SELECT * FROM customer ORDER BY code_cust DESC LIMIT 1
  sql<-paste("SELECT ", index.column(tablename)," FROM ", tablename, " ORDER BY ", index.column(tablename), "DESC LIMIT 1", sep = " ")
  rs<-dbGetQuery(conn, sql)
 
  switch(method, specimen={
      if(nrow(rs)<1){
        autoid<-"SE0001"
      }else{
        rs<-rs[1,1]
        autem<-as.numeric(substr(rs, 3, 6))+1
        newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
        autoid <- paste("SE", newautem, sep = "")
      }
      return(autoid)
  }, species = {
      if(nrow(rs)<1){
        autoid<-"SP0001"
      }else{
        rs<-rs[1,1]
        autem<-as.numeric(substr(rs, 3, 6))+1
        newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
        autoid <- paste("SP", newautem, sep = "")
      }
      return(autoid)
  }, login = {
    if(nrow(rs)<1){
      autoid<-1
    }else{
      rs<-rs[1,1]
      autoid <- as.numeric(rs) + 1
    }
    return(autoid)
  }, genus = {
    if(nrow(rs)<1){
      autoid<-"GE0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))
      autem<-autem+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("GE", newautem, sep = "")
    }
    return(autoid)
  }, family = {
    if(nrow(rs)<1){
      autoid<-"FA0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("FA", newautem, sep = "")
    }
    return(autoid)
  }, ordert = {
    if(nrow(rs)<1){
      autoid<-"OR0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("OR", newautem, sep = "")
    }
    return(autoid)
  }, class = {
    if(nrow(rs)<1){
      autoid<-"CL0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("CL", newautem, sep = "")
    }
    return(autoid)
  }, phylum = {
    if(nrow(rs)<1){
      autoid<-"PH0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("PH", newautem, sep = "")
    }
    return(autoid)
  }, kingdom = {
    if(nrow(rs)<1){
      autoid<-"KI0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("KI", newautem, sep = "")
    }
    return(autoid)
  }, locality = {
    if(nrow(rs)<1){
      autoid<-"LY0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("LY", newautem, sep = "")
    }
    return(autoid)
  }, location = {
    if(nrow(rs)<1){
      autoid<-"LC0001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 3, 6))+1
      newautem<-paste(paste(rep("0", 4-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("LC", newautem, sep = "")
    }
    return(autoid)
  }, project = {
    if(nrow(rs)<1){
      autoid<-"PRO001"
    }else{
      rs<-rs[1,1]
      autem<-as.numeric(substr(rs, 4, 6))+1
      newautem<-paste(paste(rep("0", 3-nchar(autem)), collapse=""), autem, sep = "")
      autoid <- paste("PRO", newautem, sep = "")
    }
    return(autoid)
  })
  dbDisconnect(conn)
}