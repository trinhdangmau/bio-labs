#### download species base to use offline #####
download.base<-function(phylumname, overwrite = FALSE){
  phylumname <- tolower(phylumname)
  file <- file.path("xml_base")
  if(dir.exists(file)==FALSE){
    dir.create("xml_base")
  }

  ## download phylum xml
  xml<-getxml(phylumname, method = "auto")
  xmlroot<-xmlRoot(xml)
  saveXML(xmlroot, paste(file, "/",phylumname,".xml", sep = ""))
  
  ## down load class
  xmlclass<-match.node(xmlroot, "Phylum", phylumname)[["child_taxa"]]
  nclass<-xmlSize(xmlclass)
  for(i in 1:nclass){
    classname<-tolower(xmlValue(xmlclass[[i]][["name"]]))
    xmlr.class<-xmlRoot(getxml(classname))
    saveXML(xmlr.class, paste(file, "/", classname, ".xml", sep = ""))
    ##download order
    xmlorder<-match.node(xmlr.class, "Class", phylumname)[["child_taxa"]]
    norder<-xmlSize(xmlorder)
    for(j in 1:norder){
      ordername<-tolower(xmlValue(xmlorder[[j]][["name"]]))
      xmlr.order<-xmlRoot(getxml(ordername))
      saveXML(xmlr.order, paste(file, "/", ordername, ".xml", sep = ""))
      ##download Family
      xmlfamily<-match.node(xmlr.order, "Order", phylumname)[["child_taxa"]]
      nfamily<-xmlSize(xmlfamily)
      for(k in 1:nfamily){
        familyname<-tolower(xmlValue(xmlfamily[[k]][["name"]]))
        xmlr.family<-xmlRoot(getxml(familyname))
        saveXML(xmlr.family, paste(file, "/", familyname, ".xml", sep = ""))
        ##download Genus
        xmlgenus<-match.node(xmlr.family, "Family", phylumname)[["child_taxa"]]
        ngenus<-xmlSize(xmlgenus)
        for(l in 1:ngenus){
          genusname<-tolower(xmlValue(xmlgenus[[l]][["name"]]))
          xmlr.genus<-xmlRoot(getxml(genusname))
          saveXML(xmlr.genus, paste(file, "/", genusname, ".xml", sep = ""))
          #xmlr.genus.m<-match.node(xmlr.genus, "Genus", phylumname)
          ##download Species
          download.species(xmlr.genus, overwrite = overwrite, dir = file)
        }
        cat(ngenus, " Genus belong to ", familyname, " were downloaded !\n")
      }
      cat(nfamily, " Family belong to ", ordername," were downloaded !\n")
    }
    cat(norder, " Order belong to ", classname, " were downloaded !\n")
  }
  cat(nclass, " Class belong to ", phylumname, " were downloaded!")
}