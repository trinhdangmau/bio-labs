general.search<-function(sname, type = "name", full.response = TRUE){
  xml<-getxml(sname, type = type, full.response = full.response)
  xmlroot = xmlRoot(xml)
  
  nresults<- nresult(xmlroot)
  
  res<-function(xmlroot, i, list){
    n<-length(list)
    out<-NULL
    for (j in 1:n){
      listtem<-xmlValue(xmlroot[[i]][[j]])
      out<-c(out, listtem)
    }
    out2<-list(name=list, result = out)
    return(out2)
  }
  
  nsp<-paste("sp", 1:nresults, sep = "")
  rs_m<-NULL
  rs_m[nsp]<-list(NULL)
  for (i in 1:nresults){
    listfull<-c("id", "name", "rank", "name_status", "genus")
    rs2<-res(xmlroot, i, list=listfull)
    rs_m[[nsp[i]]]<-rs2
  }
  return(rs_m)
  #
  #spname<-xmlValue(xmlroot[[1]][["name"]])
  #status<-xmlValue(xmlroot[[1]][["name_status"]])
  #out<-list(id = id, spname = spname, status = status)
  #print(paste("id = ", id, sep=""))
  #print(paste("species name = ", spname, sep=""))
  #print(paste("species status = ", status, sep=""))
}