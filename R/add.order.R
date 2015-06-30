### add order data from match.node(xmlRoot(getxml(auto))) ##
add.order<-function(xmlroot.m){
  ##add class
  name_class<-xmlValue(xmlroot.m[["classification"]][[3]][["name"]])
  id_clas_orde<-getidkey("class", paste("name_clas = '", name_class, "'",sep =""))
  name_orde<-xmlValue(xmlroot.m[["name"]])
  author_orde<-""; year_orde<-""; describe_orde<-""
  link_orde<-xmlValue(xmlroot.m[["url"]])
  id_cite_orde<-""
  insert.table("ordert", data=c("auto", id_clas_orde, name_orde, author_orde, 
                               year_orde, describe_orde, link_orde, id_cite_orde))
  
}