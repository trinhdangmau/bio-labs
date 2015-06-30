### uppercase first letter
upperfirst<-function(string){
  newstring<-paste(toupper(substr(string, 1, 1)), tolower(substr(string, 2, nchar(string))), sep="")
  return(newstring)
}