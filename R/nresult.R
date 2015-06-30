#### return number of result ####
nresult<-function(xmlroot, print = TRUE){
  header<-xmlAttrs(xmlroot)
  sname<-header[["name"]]
  nresult<-header[["number_of_results_returned"]]
  if(identical(print, TRUE)==TRUE){
    print(paste("There are ", nresult, " results for: ", sname, sep = ""))
  }
  return(nresult)
}