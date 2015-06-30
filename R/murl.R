### main url #######
murl<-function(type){
  if(type=="id"){
    sub<-"id="
  }else if(type=="name"){
    sub<-"name="
  }
  murl<-paste("http://www.catalogueoflife.org/annual-checklist/2015/webservice?", sub, sep="")
  murl
}