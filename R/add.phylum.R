#### add phylum and kingdom ###
add.phylum<-function(xmlroot.m){
  ### add kingdom
  xmlking<-xmlroot.m[["classification"]][[1]]
  name_king<-xmlValue(xmlking[["name"]])
  author_king<-""
  year_king<-""
  describe_king<-""
  link_king<-xmlValue(xmlking[["url"]])
  id_cite_king<-""
  insert.table("kingdom", data = c("auto", name_king, author_king, year_king, describe_king, link_king, id_cite_king))
  
  ##add phylum
  id_king_phyl<-getidkey("kingdom", paste("name_king = '", name_king, "'",sep =""))
  name_phyl<-xmlValue(xmlroot.m[["name"]])
  author_phyl<-""; year_phyl<-""; describe_phyl<-""
  link_phyl<-xmlValue(xmlroot.m[["url"]])
  id_cite_phyl<-""
  insert.table("phylum", data=c("auto", id_king_phyl, name_phyl, author_phyl, year_phyl, describe_phyl, link_phyl, id_cite_phyl))
  
}