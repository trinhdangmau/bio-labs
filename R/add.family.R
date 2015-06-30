### add family data from match.node(xmlRoot(getxml(auto))) ##
add.family<-function(xmlroot.m){
  ##add family
  name_order<-xmlValue(xmlroot.m[["classification"]][[4]][["name"]])
  id_orde_fami<-getidkey("ordert", paste("name_orde = '", name_order, "'",sep =""))
  name_fami<-xmlValue(xmlroot.m[["name"]])
  author_fami<-""; year_fami<-""; describe_fami<-""
  link_fami<-xmlValue(xmlroot.m[["url"]])
  id_cite_fami<-""
  insert.table("family", data=c("auto", id_orde_fami, name_fami, author_fami, 
                               year_fami, describe_fami, link_fami, id_cite_fami))
  
}