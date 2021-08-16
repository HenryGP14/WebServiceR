# INSTALACION DE PAQUETES
# install.packages("plumber")
# install.packages("RPostgreSQL")

# CARGA DE PAQUETES
library(plumber)
library(RPostgreSQL)
library(DBI)

get_conectBD = function(){
  driver <- RPostgreSQL::PostgreSQL()
  dbname <- "contagios_covid"
  url_host <- "localhost"
  port <- 5432
  password <- "123456"
  conexion_BD <- dbConnect(driver, dbname = dbname, host = url_host, port = port, user = "postgres", password = password) 
  return (conexion_BD)
}

#* Echo back the input
#* @get /provincias
function() {
  query <- "SELECT * from provincia"
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  provincias
}

#* Echo back the input
#* @param id obtener provincia por id
#* @get /provincia_id
function(id = "") {
  query <- paste0("SELECT * from provincia WHERE public.provincia.idprovincia=","'",id,"'")
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  provincias
}

#* Echo back the input
#* @param name obtener provincia por nombre
#* @get /provincia_name
function(name = "") {
  query <- paste0("SELECT * from provincia WHERE public.provincia.provincia=","'",name,"'")
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  provincias
}

#* Plot a histogram
#* @serializer png
#* @get /plot_provincia
function(campo = "") {
  query <- paste0("SELECT * from provincia")
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  hist(as.numeric(provincias[,campo]))
}
