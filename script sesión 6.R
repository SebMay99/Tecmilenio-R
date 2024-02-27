install.packages("DBI")
install.packages("RMySQL")

# Conectar con DB en SQL

db = dbConnect(drv = RMySQL::MySQL(),
               dbname ="shinydemo",
               host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
               username = "guest",
               password = "guest")

# Enlistar tablas disponibles

dbListTables(db)

# Consultar City y filtrar

ciudad = dbGetQuery(db, "select * FROM City")
View(ciudad)
ciudad = dbGetQuery(db, "select * FROM City ORDER BY Population DESC")
View(ciudad)

# Análisis de variables

poblacion.media = mean(ciudad$Population)

# Seleccionar Tabla

pais = dbGetQuery(db, "SELECT * FROM Country")
View(pais)
