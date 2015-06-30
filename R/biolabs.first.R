#### create database #####
biolabs.first<-function(dbname){
  if(file.exists(dbname)==TRUE){
    cat("The file is exist : ", dbname ,"\nDo you want to overwrite it! (y/n)?\n")
    ans <- readLines(n = 1)
    if(ans=="y"){
      file.remove(dbname)
      dbConnect(RSQLite::SQLite(), dbname=dbname)
    }
    if(ans=="n"){
      stop("Function was cancel!")
    }
  }
  conn = dbConnect(RSQLite::SQLite(), dbname=dbname)
  ##### create all table Login
  sql_login<-"CREATE TABLE `login` (
  `id_logi` INT NOT NULL,
  `firstname_logi` VARCHAR(45) NULL, 
  `lastname_logi` VARCHAR(45) NULL,
  `username_logi` VARCHAR(45) NULL, 
  `password_logi` VARCHAR(45) NULL,
  `title_logi` VARCHAR(1) NULL,
  `position_logi` VARCHAR(45) NULL,
  `level_logi` VARCHAR(45) NULL, 
  PRIMARY KEY (`id_logi`))"
  dbSendQuery(conn = conn, sql_login)
  ###create table project
  sql_project<-"CREATE TABLE `project` (
  `id_proj` VARCHAR(6) NOT NULL,
  `name_proj` VARCHAR(45) NULL, 
  `author_proj` VARCHAR(45) NULL,
  `time_proj` VARCHAR(45) NULL, 
  `description_proj` TEXT NULL, 
  PRIMARY KEY (`id_proj`))"
  dbSendQuery(conn = conn, sql_project)
  
  ##create table location
  sql_location<-"CREATE TABLE `location` (
  `id_loca` VARCHAR(6) NOT NULL, 
  `id_proj_loca` VARCHAR(6) NULL, 
  `name_loca` VARCHAR(45) NOT NULL,
  `type_loca` VARCHAR(45) NULL, 
  `coordinate_loca` VARCHAR(45) NULL, 
  `wards_loca` VARCHAR(45) NULL,
  `city_loca` VARCHAR(45) NULL, 
  `province_loca` VARCHAR(45) NULL, 
  `country_loca` VARCHAR(45) NULL,
  `describe_loca` TEXT NULL, 
  PRIMARY KEY (`id_loca`))"
  dbSendQuery(conn = conn,sql_location)
  
  ##create table locality
  sql_locality<-"CREATE TABLE `locality` ( 
  `id_loty` VARCHAR(6) NOT NULL,
  `id_loca_loty` VARCHAR(6) NOT NULL,
  `name_loty` VARCHAR(45) NOT NULL, 
  `type_loty` VARCHAR(45) NULL,
  `date_loty` DATE NULL, 
  `coordinate_loty` VARCHAR(45) NULL,
  `describe_loty` TEXT NULL, 
  PRIMARY KEY (`id_loty`))"
  dbSendQuery(conn = conn,sql_locality)
  
  ##create table reference
  sql_reference<-"CREATE TABLE `reference` (
  `id_refe` INT NOT NULL,
  `author_refe` VARCHAR(45) NULL, 
  `year_refe` YEAR NULL,
  `title_refe` VARCHAR(200) NULL, 
  `published_refe` VARCHAR(45) NULL,
  `pages_refe` VARCHAR(45) NULL, 
  `type_refe` VARCHAR(45) NULL,
  `link_refe` VARCHAR(45) NULL, 
  `dir_refe` VARCHAR(45) NULL, 
  PRIMARY KEY (`id_refe`))"
  dbSendQuery(conn = conn, sql_reference)
  
  ## create table citekey
  sql_citekey<-"CREATE TABLE `citekey` (
  `id_cite` VARCHAR(6) NOT NULL,
  `cide_code` VARCHAR(200) NULL, 
  PRIMARY KEY (`id_cite`))"
  dbSendQuery(conn = conn, sql_citekey)
  
  ## create table main.taxonomic
  sql_main.taxonomic<-"CREATE TABLE `kingdom` (
  `id_king` VARCHAR(6) NOT NULL,
  `name_king` VARCHAR(45) NOT NULL, 
  `author_king` VARCHAR(45) NULL,
  `year_king` YEAR NULL, 
  `describe_king` TEXT NULL, 
  `link_king` TEXT NULL,
  `id_cite_king` VARCHAR(6) NULL, 
  PRIMARY KEY (`id_king`))"
  dbSendQuery(conn = conn, sql_main.taxonomic)
  
  ## create table phylum
  sql_phylum<-"CREATE TABLE `phylum` (
  `id_phyl` VARCHAR(6) NOT NULL,
  `id_king_phyl` VARCHAR(6) NOT NULL, 
  `name_phyl` VARCHAR(45) NOT NULL, 
  `author_phyl` VARCHAR(45) NULL,
  `year_phyl` YEAR NULL, 
  `describe_phyl` TEXT NULL, 
  `link_phyl` TEXT NULL,
  `id_cite_phyl` VARCHAR(6) NULL,
  PRIMARY KEY (`id_phyl`))"
  dbSendQuery(conn = conn, sql_phylum)
  
  ## create table class
  sql_class<-"CREATE TABLE `class` (
  `id_clas` VARCHAR(6) NOT NULL,
  `id_phyl_class` VARCHAR(6) NOT NULL,
  `name_clas` VARCHAR(45) NOT NULL, 
  `author_clas` VARCHAR(45) NULL,
  `year_clas` YEAR NULL, 
  `describe_clas` TEXT NULL,
  `link_clas` TEXT NULL, 
  `id_cite_clas` VARCHAR(6) NULL,
  PRIMARY KEY (`id_clas`))"
  dbSendQuery(conn = conn, sql_class)
  
  ##create table order
  sql_order<-"CREATE TABLE `ordert` (
  `id_orde` VARCHAR(6) NOT NULL,
  `id_clas_orde` VARCHAR(6) NOT NULL,
  `name_orde` VARCHAR(45) NOT NULL, 
  `author_orde` VARCHAR(45) NULL,
  `year_orde` YEAR NULL, 
  `describe_orde` TEXT NULL,
  `link_orde` TEXT NULL, 
  `id_cite_orde` VARCHAR(6) NULL,
  PRIMARY KEY (`id_orde`))"
  dbSendQuery(conn = conn, sql_order)
  
  ##create table family
  sql_family<-"CREATE TABLE `family` (
  `id_fami` VARCHAR(6) NOT NULL,
  `id_orde_fami` VARCHAR(6) NOT NULL,
  `name_fami` VARCHAR(45) NOT NULL,
  `author_fami` VARCHAR(45) NULL,
  `year_fami` YEAR NULL,
  `describe_fami` TEXT NULL,
  `link_fami` TEXT NULL,
  `id_cite_fami` VARCHAR(6) NULL,
  PRIMARY KEY (`id_fami`))"
  dbSendQuery(conn = conn, sql_family)
  
  ##create table genus
  sql_genus<-"CREATE TABLE `genus` (
  `id_genu` VARCHAR(6) NOT NULL,
  `id_fami_genu` VARCHAR(6) NOT NULL,
  `name_genu` VARCHAR(45) NOT NULL,
  `author_genu` VARCHAR(45) NULL,
  `year_genu` YEAR NULL,
  `describe_genu` TEXT NULL,
  `link_genu` TEXT NULL,
  `id_cite_genu` VARCHAR(6) NULL,
  PRIMARY KEY (`id_genu`))"
  dbSendQuery(conn = conn, sql_genus)
  
  ##create table species
  sql_species<-"CREATE TABLE `species` (
  `id_spec` VARCHAR(6) NOT NULL,
  `id_genu_spec` VARCHAR(6) NOT NULL,
  `name_spec` VARCHAR(45) NULL,
  `author_spec` VARCHAR(45) NULL,
  `year_spec` YEAR NULL,
  `describe_spec` TEXT NULL,
  `distribution_spec` TEXT NULL,
  `link_spec` TEXT NULL,
  `id_cite_spec` VARCHAR(6) NULL,
  `count_spec` VARCHAR(1) NULL,
  `note_spec` TEXT NULL,
  PRIMARY KEY (`id_spec`))"
  dbSendQuery(conn = conn, sql_species)
  
  ##create table specimen
  sql_specimen<-"CREATE TABLE `specimen` (
  `id_spmen` VARCHAR(6) NOT NULL,
  `id_spec_spmen` VARCHAR(6) NOT NULL,
  `id_loty_spmen` VARCHAR(6) NOT NULL,
  `time_spmen` DATETIME NULL,
  `note_spmen` TEXT NULL,
  `c50` DECIMAL(10,0) NULL,
  `c100` DECIMAL(10,0) NULL,
  `c150` DECIMAL(10,0) NULL,
  `c200` DECIMAL(10,0) NULL,
  `c250` DECIMAL(10,0) NULL,
  `c300` DECIMAL(10,0) NULL,
  `c350` DECIMAL(10,0) NULL,
  `c400` DECIMAL(10,0) NULL,
  `c450` DECIMAL(10,0) NULL,
  `c500` DECIMAL(10,0) NULL,
  `c700` DECIMAL(10,0) NULL,
  `stotal` DECIMAL(10,0) NULL,
  PRIMARY KEY (`id_spmen`))"
  dbSendQuery(conn = conn, sql_specimen)
}
