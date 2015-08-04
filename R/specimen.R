#### add special for specimen ###
specimen.new<-function(id = "auto", id_species, id_locality, time = "", note = ""){
	if(identical(time, "now") == TRUE) time<-format(Sys.time(), "%d-%m-%Y")
	rs<-checkmatch("specimen", data = c(id, id_species, id_locality))

	conn<-conn()
    	rs2<-dbGetQuery(conn, paste("Select id_spec_spmen from specimen where id_loty_spmen = '", id_locality, "' and id_spec_spmen = '", id_species, "'", sep = ""))
	dbDisconnect(conn)
	if(nrow(rs2)>0) {
	cat("This species already exist in locality.\nDo you want to add a duplicate?(y/n)")
	ans<-readLines(n = 1)
	if(ans == "n") stop("Cancel, specimen was NOT add")
	}

	if(identical(rs, TRUE) == FALSE) stop("Please make sure species id and locality are corrected!")
    insert.table("specimen", data = c(id, id_species, id_locality, time, note))
    cat("New specimen added!")
}

### edit specimen information ##
specimen.edit<-function(id, id_species="", id_locality="", time = "", note = ""){
    conn<-conn()

    rs<- dbGetQuery(conn, sql_idtabel("specimen", id))
    if(nchar(id_species==0)) id_species<-rs["id_spec_spmen"][1,1]
    if (nchar(id_locality)==0) id_locality<-rs["id_loty_spmen"][1,1]
    if (nchar(time)==0) time<-rs["time_spmen"][1,1]
    if(nchar(note)==0) note<-rs["note_spmen"][1,1]
    update.table("specimen", data = c(id, id_species, id_locality, time, note))

    dbDisconnect(conn)
}

### delete from specimen ###
specimen.delete <- function(id){
        cat("Are you sure that you would like to delete this specimen (y/n)?\n")
        ans <- readLines(n = 1)
        if(ans=="n") stop("Cancel")
    	delete.table("specimen", id)
}

### View specimen
specimen.view<-function(id = T, id_species = T, id_locality = F, time = T, note = F){
    if (identical(id, TRUE)==TRUE) fields<-"id_spmen"
    if (identical(id_species, TRUE)==TRUE) fields<-paste(fields, "id_spec_spmen", sep = ",")
    if (identical(id_locality, TRUE)==TRUE) fields<-paste(fields, "id_loty_spmen", sep = ",")
    if(identical(time, TRUE)==TRUE) fields<-paste(fields, "time_spmen", sep = ",")
    if(identical(note, TRUE)==TRUE) fields<-paste(fields, "note_spmen", sep = ",")
    showdata("specimen", fields)
}
