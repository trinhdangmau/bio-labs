##download Species belong an genus
download.species<-function(xmlr.genus, dir, overwrite = FALSE, phylum = "Rotifera"){
  genusname<-xmlValue(xmlr.genus[[1]][["name"]])
  xmlspecies<-match.node(xmlr.genus, "Genus", phylum)[["child_taxa"]]
  nspecies<-xmlSize(xmlspecies)
  for(s in 1:nspecies){
    cat("- ")
    speciesname<-tolower(xmlValue(xmlspecies[[s]][["name"]]))
    speciesname<-gsub(" ", "%20", speciesname)
    file<-paste(dir, "/", speciesname, ".xml", sep = "")
    if(file.exists(file)==TRUE){
      if(identical(overwrite, "TRUE")==TRUE){
        xmlr.species<-xmlRoot(getxml(speciesname, method = "auto"))
        saveXML(xmlr.species, file)
      }
    }else{
      xmlr.species<-xmlRoot(getxml(speciesname, method = "auto"))
      saveXML(xmlr.species, file)
    }
  }
  cat(nspecies, " Species belong to ", genusname, " were downloaded!\n")
}