# INSTALACION DE PAQUETES
# install.packages("plumber")
require(plumber);
require(rstudioapi);
doc <- dirname(getActiveDocumentContext()$path)
path <- paste(doc, "/", "plumber.R", sep = "")
services <- plumb(path)
services$run(port = 3731)
