### Adding Rotifera base (phylum to genera) to current database
##Data base from catalogueoflife
addbase<-function(phylum){
  ## add kingdom
  phylumname<-tolower(phylum)
  file <- file.path("xml_base")
  
  ## phylum xml
  xml<-getxml(phylumname, method = "auto")
  xmlroot.m<-match.node(xmlRoot(xml), "Phylum", "Rotifera")
  ## add kingdom and phylum
  add.phylum(xmlroot.m)
  
  ## load class
  xmlclass<-xmlroot.m[["child_taxa"]]
  nclass<-xmlSize(xmlclass)
  for(i in 1:nclass){
    classname<-tolower(xmlValue(xmlclass[[i]][["name"]]))
    xmlr.class.m<-match.node(xmlRoot(getxml(classname, method = "auto")), "Class", phylumname)
    add.class(xmlr.class.m)
    
    ##download order
    xmlorder<-xmlr.class.m[["child_taxa"]]
    norder<-xmlSize(xmlorder)
    for(j in 1:norder){
      ordername<-tolower(xmlValue(xmlorder[[j]][["name"]]))
      xmlr.order.m<-match.node(xmlRoot(getxml(ordername)), "Order", phylumname)
      add.order(xmlr.order.m)
      #saveXML(xmlr.order, paste(file, "/", ordername, ".xml", sep = ""))
      ##download Family
      xmlfamily<-xmlr.order.m[["child_taxa"]]
      nfamily<-xmlSize(xmlfamily)
      for(k in 1:nfamily){
        familyname<-tolower(xmlValue(xmlfamily[[k]][["name"]]))
        xmlr.family.m<-match.node(xmlRoot(getxml(familyname)), "Family", phylumname)
        add.family(xmlr.family.m)
        #saveXML(xmlr.family, paste(file, "/", familyname, ".xml", sep = ""))
        ##download Genus
        xmlgenus<-xmlr.family.m[["child_taxa"]]
        ngenus<-xmlSize(xmlgenus)
        for(l in 1:ngenus){
          genusname<-tolower(xmlValue(xmlgenus[[l]][["name"]]))
          xmlr.genus.m<-match.node(xmlRoot(getxml(genusname)), "Genus", phylumname)
          add.genus(xmlr.genus.m)
          #saveXML(xmlr.genus, paste(file, "/", genusname, ".xml", sep = ""))
          #xmlr.genus.m<-
        }
        cat(ngenus, " Genus belong to ", familyname, " were added !\n")
      }
      cat(nfamily, " Family belong to ", ordername," were added !\n")
    }
    cat(norder, " Order belong to ", classname, " were added !\n")
  }
  cat(nclass, " Class belong to ", phylumname, " were added!")
}