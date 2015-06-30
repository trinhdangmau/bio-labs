### add class data from match.node(xmlRoot(getxml(auto))) ##
add.class<-function(xmlroot.m){
  ##add class
  name_phyl<-xmlValue(xmlroot.m[["classification"]][[2]][["name"]])
  id_phyl_class<-getidkey("phylum", paste("name_phyl = '", name_phyl, "'",sep =""))
  name_clas<-xmlValue(xmlroot.m[["name"]])
  author_clas<-""; year_clas<-""; describe_clas<-""
  link_clas<-xmlValue(xmlroot.m[["url"]])
  id_cite_clas<-""
  insert.table("class", data=c("auto", id_phyl_class, name_clas, author_clas, 
                               year_clas, describe_clas, link_clas, id_cite_clas))
  
}