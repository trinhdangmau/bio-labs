#### check match file between table ####
## use to check higher order table is exist or not #
#ex. add species check genus of that species is exist or not #
checkmatch<-function(table, data){
  conn<-conn()
  tblist<-dbListTables(conn)
  method<-match.arg(table, tblist)
  
  switch(method, specimen={
    id_spec_spmen <- data[2]
    id_loty_spmen <- data[3]
    #sql_id_spec<-paste("SELECT * FROM species WHERE id_spec = '", id_spec_spmen, "'", sep = "")
    rs_id_spec <- dbGetQuery(conn, sql_idtabel("species", id_spec_spmen))
    if(nrow(rs_id_spec)==0){
      cat("The species ID: ", id_spec_spmen, "was not exist!\n Please add this species into data first")
      return("FALSE")
    }
    
    rs_id_loty<- dbGetQuery(conn, sql_idtabel("locality", id_loty_spmen))
    if(nrow(rs_id_loty)==0){
      cat("The locality ID: ", id_loty_spmen, " was not exist!\nPlease add this locality id to data first!")
      return("FALSE")
    }
  }, species={
    id_genu_spec<-data[2]
    rs_id_genu<- dbGetQuery(conn, sql_idtabel("genus", id_genu_spec))
    if(nrow(rs_id_genu)==0){
      cat("The genus ID: ", id_genu_spec, " was not exist!\nPlease add this genus id to data first!")
      return("FALSE")
    }
  }, genus={
    id_fami_genu<-data[2]
    rs_id_fami<- dbGetQuery(conn, sql_idtabel("family", id_fami_genu))
    if(nrow(rs_id_fami)==0){
      cat("The genus ID: ", id_fami_genu, " was not exist!\nPlease add this genus id to data first!")
      return("FALSE")
    }
  }, family={
    id_orde_fami<-data[2]
    rs_id_orde<- dbGetQuery(conn, sql_idtabel("ordert", id_orde_fami))
    if(nrow(rs_id_orde)==0){
      cat("The genus ID: ", id_orde_fami, " was not exist!\nPlease add this genus id to data first!")
      return("FALSE")
    }
  }, ordert={
    id_clas_orde<-data[2]
    rs_id_clas<- dbGetQuery(conn, sql_idtabel("class", id_clas_orde))
    if(nrow(rs_id_clas)==0){
      cat("The genus ID: ", id_clas_orde, " was not exist!\nPlease add this genus id to data first!")
      return("FALSE")
    }
  }, class={
    id_phyl_clas<-data[2]
    rs_id_phyl<- dbGetQuery(conn, sql_idtabel("phylum", id_phyl_clas))
    if(nrow(rs_id_phyl)==0){
      cat("The genus ID: ", id_phyl_clas, " was not exist!\nPlease add this genus id to data first!")
      return("FALSE")
    }
  }, phylum={
    id_king_phyl<-data[2]
    rs_id_king<- dbGetQuery(conn, sql_idtabel("kingdom", id_king_phyl))
    if(nrow(rs_id_king)==0){
      cat("The genus ID: ", id_king_phyl, " was not exist!\nPlease add this genus id to data first!")
      return("FALSE")
    }
  }, locality={
    id_loca_loty<-data[2]
    rs_id_loca<- dbGetQuery(conn, sql_idtabel("location", id_loca_loty))
    if(nrow(rs_id_loca)==0){
      cat("The LOCATION ID: ", id_loca_loty, " was not exist!\nPlease add this Location id to data first!")
      return("FALSE")
    }
  }, location={
    id_proj_loca<-data[2]
    rs_id_proj<- dbGetQuery(conn, sql_idtabel("project", id_proj_loca))
    if(nrow(rs_id_proj)==0){
      cat("The Project : ", id_proj_loca, " was not exist!\nPlease add this Location id to data first!")
      return("FALSE")
    }
  })
  
  dbDisconnect(conn)
}

### return index colum name for a table ##
index.column<-function(tablename){
  conn <- conn()
  sql_indexname<-paste("SELECT name FROM sqlite_master WHERE type = 'index' AND tbl_name ='", tablename, "'", sep = "")
  indexname<-dbGetQuery(conn, sql_indexname)[[1]]
  sql_indexcol<-paste("PRAGMA index_info(", indexname, ")", sep = "")
  indexcol<-dbGetQuery(conn, sql_indexcol)$name
  dbDisconnect(conn)
  
  return(indexcol)
}

### prepare stament for select tabel and id tabel ###
sql_idtabel<-function(tablename, data_compare){
  sql_idtabel<-paste("SELECT * FROM ", tablename," WHERE ", index.column(tablename) ,"= '", data_compare, "'", sep = "")
  return(sql_idtabel)
}