### for match high taxon
match.node<-function(xmlroot, rank, phylum){ 
  nresutl <- as.numeric(nresult(xmlroot, print = FALSE))
  phylum<-upperfirst(phylum)
  if(nresutl > 1){
    i = 1; rk <- NULL
    matchnode<-NULL
    while(i < nresutl){
      rk<- xmlValue(xmlroot[[i]][["rank"]])
      matchnode<-xmlroot[[i]]
      if(identical(rk, rank)==TRUE){
        if(identical(rank, "Phylum")==TRUE) break;
        pl<-xmlValue(xmlroot[[i]][["classification"]][[2]][["name"]])
        if(identical(pl, phylum)==TRUE) break;
      }
      i = i+1
    }
    return(matchnode)
  }else{return(xmlroot[[1]])}
}