# INSTALACION DE PAQUETES
# install.packages("plumber")
# install.packages("RPostgreSQL")
# install.packages("DBI")
# install.packages("jsonlite")
# install.packages("rstudioapi")

# CARGA DE PAQUETES
require(plumber)
require(RPostgreSQL)
require(DBI)
require(jsonlite)
require(rstudioapi)

#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*") # Or whatever
  res$setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, USE, DELETE,
HEAD, OPTIONS, PATCH")

  res$setHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-
Requested-with, Origin, authorization")

  plumber::forward()
}

# Conexion a la base de datos
get_conectBD = function() {
  driver <- RPostgreSQL::PostgreSQL()
  doc <- dirname(getActiveDocumentContext()$path)
  ruta_archivo <- paste(doc, "/", "config.json", sep = "")
  json = fromJSON(ruta_archivo)
  dbname <- json$db_name
  url_host <- json$db_host
  user = json$db_user
  port <- json$db_port
  password <- json$db_pass
  conexion_BD <- dbConnect(driver, dbname = dbname, host = url_host, port = port, user = user, password = password)
  return(conexion_BD)
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
  query <- paste0("SELECT * from provincia WHERE public.provincia.idprovincia=", "'", id, "'")
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  provincias
}

#* Echo back the input
#* @param name obtener provincia por nombre
#* @get /provincia_name
function(name = "") {
  query <- paste0("SELECT * from provincia WHERE public.provincia.provincia=", "'", name, "'")
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  provincias
}

#* Plot a histogram
#* @serializer png
#* @get /plot_provincia
function(campo = "") {
  query <- "SELECT * from provincia"
  connection <- get_conectBD()
  provincias <- dbGetQuery(connection, query)
  dbDisconnect(connection)
  hist(as.numeric(provincias[, campo]))
}
