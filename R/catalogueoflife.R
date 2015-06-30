#### search ###
cata.search<-function(name, type = "name", full.response = TRUE){
  xml<-getxml(name, type = type, full.response = full.response)
  xmltop = xmlRoot(xml)
  id<-xmlValue(xmltop[[1]][["id"]])
  spname<-xmlValue(xmltop[[1]][["name"]])
  status<-xmlValue(xmltop[[1]][["name_status"]])
  out<-list(id = id, spname = spname, status = status)
  print(paste("id = ", id, sep=""))
  print(paste("species name = ", spname, sep=""))
  print(paste("species status = ", status, sep=""))
}