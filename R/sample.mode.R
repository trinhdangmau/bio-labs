sample.mode<-function(id_locality){
id_loty<-id_locality
rs = NULL
while (identical(rs, "finish")==FALSE){
	cat("Please add new species ID or NAME:\n")
	rs<-readLines(n = 1)
	#rs<-toupper(rs)
	#methods <- c("id", "name")
	rssub<-strsplit(gsub(" ", "", rs),"=")[[1]]
	methods<-c("id", "name")	
	method<-match.arg(rssub[1], methods)
	id<-rssub[2]
if(identical(rs, "finish")==FALSE){
	switch(method, id={
		id_spec<-toupper(id)
		specimen.new(id_species=id_spec, id_locality=id_loty, time = "now")
	}, name = {
		conn<-conn()
		spname<-tolower(id)
		id_spec<-dbGetQuery(conn, paste("select id_spec from species where name_spec = '", spname, "'", sep = ""))[1,1]
		dbDisconnect(conn)
		specimen.new(id_species=id_spec, id_locality=id_loty, time = "now")
	})
	}#if(identical)
}#while
}
