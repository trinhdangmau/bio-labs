###get xml file ############
getxml<-function(name, type = "name", full.response = TRUE, method = "auto"){
  name<-gsub(" ", "%20", name)
  methods<-c("online", "offline", "auto")
  method<-match.arg(method, methods)
  switch(method, online={
    if(full.response == TRUE){
      url<-paste(murl(type), name, "&response=full", sep="")
    }else{
      url<-paste(murl(type), name, sep="")
    }
    xml<-xmlTreeParse(url)
  }, offline={
    file<-paste("xml_base/", name, ".xml", sep="")
    xml<-xmlTreeParse(file)
  }, auto = {
    file<-paste("xml_base/", name, ".xml", sep="")
    if(file.exists(file)==TRUE){
      xml<-xmlTreeParse(file)
    }else{
      if(full.response == TRUE){
        url<-paste(murl(type), name, "&response=full", sep="")
      }else{
        url<-paste(murl(type), name, sep="")
      }
      xml<-xmlTreeParse(url)
    }
  })
  return(xml)
}