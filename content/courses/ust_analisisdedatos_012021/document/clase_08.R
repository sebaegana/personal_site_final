devtools::install_github("bergant/datamodelr")

library(datamodelr)
file_path <- system.file("samples/example.yml", package = "datamodelr")
dm <- dm_read_yaml(file_path)

graph <- dm_create_graph(dm, rankdir = "BT")
dm_render_graph(graph)

shiny::runApp(system.file("shiny", package = "datamodelr"))

library("nycflights13")
dm_f <- dm_from_data_frames(flights, airlines, weather, airports, planes)

graph <- dm_create_graph(dm_f, rankdir = "BT", col_attr = c("column", "type"))
dm_render_graph(graph)

dm_f <- dm_add_references(
  dm_f,
  
  flights$carrier == airlines$carrier,
  flights$origin == airports$faa,
  flights$dest == airports$faa,
  flights$tailnum == planes$tailnum,
  weather$origin == airports$faa
)
graph <- dm_create_graph(dm_f, rankdir = "BT", col_attr = c("column", "type"))
dm_render_graph(graph)


library(readxl)

flights_01 <- read_excel("G:/My Drive/Docencia 2020 - 2021/UST - 2021 01 Análisis de Datos/excel/clase_08.xlsx",
              sheet = "Flights")

routes_01 <- read_excel("G:/My Drive/Docencia 2020 - 2021/UST - 2021 01 Análisis de Datos/excel/clase_08.xlsx",
                         sheet = "Routes")

airports_01 <- read_excel("G:/My Drive/Docencia 2020 - 2021/UST - 2021 01 Análisis de Datos/excel/clase_08.xlsx",
                         sheet = "Airports")

aircraft_01 <- read_excel("G:/My Drive/Docencia 2020 - 2021/UST - 2021 01 Análisis de Datos/excel/clase_08.xlsx",
                         sheet = "Aircraft")


dm_f <- dm_from_data_frames(flights_01, routes_01, aircraft_01, airports_01)
graph <- dm_create_graph(dm_f, rankdir = "BT", col_attr = c("column", "type"))
dm_render_graph(graph)

dm_f <- dm_add_references(
  dm_f,
  
  aircraft_01$AircraftID == flights_01$AircraftID,
  airports_01$AirportID == routes_01$AirportID,
  flights_01$RouteID == routes_01$RouteID
)
graph <- dm_create_graph(dm_f, rankdir = "BT", col_attr = c("column", "type"))
dm_render_graph(graph)

graph <- dm_create_graph( 
  dm_f, 
  graph_attrs = "rankdir = RL, bgcolor = '#F4F0EF' ", 
  edge_attrs = "dir = both, arrowtail = crow, arrowhead = odiamond",
  node_attrs = "fontname = 'Arial'")

dm_render_graph(graph)


