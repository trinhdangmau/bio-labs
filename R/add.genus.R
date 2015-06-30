### add genus data from match.node(xmlRoot(getxml(auto))) ##
add.genus<-function(xmlroot.m){
  ##add family
  name_family<-xmlValue(xmlroot.m[["classification"]][[5]][["name"]])
  id_fami_genu<-getidkey("family", paste("name_fami = '", name_family, "'",sep =""))
  name_genu<-xmlValue(xmlroot.m[["name"]])
  author_genu<-""; year_genu<-""; describe_genu<-""
  link_genu<-xmlValue(xmlroot.m[["url"]])
  id_cite_genu<-""
  insert.table("genus", data=c("auto", id_fami_genu, name_genu, author_genu, 
                                year_genu, describe_genu, link_genu, id_cite_genu))
  
}