#### add special for species ###
species.new<-function(id = "auto", id_genus, name, author = "", year = "",
                       describe = "", distribution = "", link = "", id_cite = "", count = 0, note=""){
    insert.table("species", data = c(id, id_genus, name, author, year, describe, distribution, link, id_cite, count, note))
    cat("New species added!")
}

### edit species information ##
species.edit<-function(id, id_genus = "", name = "", author = "", year = "",
                       describe = "", distribution = "", link = "", id_cite = "", count = 0, note=""){
    conn<-conn()

    rs<- dbGetQuery(conn, sql_idtabel("species", id))
    if(nchar(id_genus==0)) id_genus<-rs["id_genu_spec"][1,1]
    if (nchar(name)==0) name<-rs["name_spec"][1,1]
    if (nchar(author)==0) author<-rs["author_spec"][1,1]
    if(nchar(year)==0) year<-rs["year_spec"][1,1]
    if(nchar(describe)==0) describe<-rs["describe_spec"][1,1]
    if(nchar(distribution)==0) distribution <- rs["distribution_spec"][1,1]
    if (nchar(link)==0) link<-rs["link_spec"][1,1]
    if (nchar(id_cite)==0) id_cite<-rs["id_cite_spec"][1,1]
    if (nchar(count)==0) count<-rs["count_spec"][1,1]
    if (nchar(note)==0) note<-rs["note_spec"][1,1]
    update.table("species", data = c(id, id_genus, name, author, year, describe, distribution, link, id_cite, count, note))

    dbDisconnect(conn)
}

### delete from species ###
species.delete <- function(id){
    conn<-conn()
    rs<-dbGetQuery(conn, paste("Select * from specimen where id_spec_spmen = ", id, sep = ""))
    if(nrow(rs)>0){
        cat("This species exist in specimen data\nDo you want to delete species?\n(The speciem also will be delete) (y/n)?\n")
        ans <- readLines(n = 1)
        if(ans=="y"){
            delete.table("species", id)
        }
        if(ans=="n"){
            stop("Function was cancel!")
        }
    }
    delete.table("species", id)
}

### View species
species.view<-function(id = T, id_genus = T, name = T, author = F, year = F,
                       describe = F, distribution = F, link = F, id_cite = F,
                       count = F, note = F){
    if (identical(id, TRUE)==TRUE) fields<-"id_spec"
    if (identical(id_genus, TRUE)==TRUE) fields<-paste(fields, "id_genu_spec", sep = ",")
    if (identical(name, TRUE)==TRUE) fields<-paste(fields, "name_spec", sep = ",")
    if(identical(author, TRUE)==TRUE) fields<-paste(fields, "author_spec", sep = ",")
    if(identical(year, TRUE)==TRUE) fields<-paste(fields, "year_spec", sep = ",")
    if(identical(describe, TRUE)==TRUE) fields<-paste(fields, "describe_spec", sep = ",")
    if(identical(distribution, TRUE)==TRUE) fields<-paste(fields, "distribution_spec", sep = ",")
    if(identical(link, TRUE)==TRUE) fields<-paste(fields, "link_spec", sep = ",")
    if(identical(id_cite, TRUE)==TRUE) fields<-paste(fields, "id_cite_spec", sep = ",")
    if(identical(count, TRUE)==TRUE) fields<-paste(fields, "count_spec", sep = ",")
    if(identical(note, TRUE)==TRUE) fields<-paste(fields, "note_spec", sep = ",")
    showdata("species", fields)
}
