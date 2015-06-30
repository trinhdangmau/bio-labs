### add species with data from catalogue_of_life ###
addspecies<-function(spname, phylname, count = 0, note=""){
  spname<-tolower(spname)
  phylname<-upperfirst(phylname)
  spname<-gsub(" ", "%20", spname)
  xmlr.species<-xmlRoot(getxml(spname, method = "auto"))
  #nresult<-nresult(xmlr.species, print = FALSE)
  xmlr.sp.m<-match.node(xmlr.species, "Species", phylname)
  status<-xmlValue(xmlr.sp.m[["name_status"]])
  if(identical(status,"accepted name")==TRUE){
    name_genu<-xmlValue(xmlr.sp.m[["genus"]])
    id_genu_spec<-getidkey("genus", paste("name_genu = '", name_genu, "'",sep =""))
    name_spec<-xmlValue(xmlr.sp.m[["species"]])
    ###check exist species ##
    conn<-conn()
    sql<-paste("select id_genu_spec from species where name_spec = '", name_spec, "' AND id_genu_spec = '", id_genu_spec, "'", sep = "")
    rs<-dbGetQuery(conn, sql)
    dbDisconnect(conn)
    
    n<- as.numeric(nrow(rs))
    if(n==0){
      author_spec<-xmlValue(xmlr.sp.m[["author"]])
      tem<-as.numeric(unlist(strsplit(author_spec, "[^[:digit:]]")))
      year_spec<-unique(tem[!is.na(tem)])
      describe_spec<-""
      distribution_spec<-xmlValue(xmlr.sp.m[["distribution"]])
      link_spec<-xmlValue(xmlr.sp.m[["url"]])
      id_cite_spec<-""
      count_spec<-count
      note_spec<-note
      insert.table("species", data = c("auto", id_genu_spec, name_spec, author_spec, year_spec, describe_spec, 
                                       distribution_spec, link_spec, id_cite_spec, count_spec, note_spec))
      cat("species ", name_genu, " ", name_spec, " was added!")
    }else{
      cat("Species ", spname, " was existed in database!")
    }
    
    ####
    
  }else{
    cat("species ", spname, " not FOUND!")
    }
}