# Code: Proc --------------------------------------------------------------
# 1. Load packages --------------------------------------------------------
pacman::p_load(tidyverse, readr, sjPlot)

# 2. Load data ------------------------------------------------------------
file_names=as.list(dir(path ="input/data/", pattern="*.R"))
file_names = lapply(file_names, function(x) paste0('input/data/', x))
lapply(file_names, load, environment()); remove(file_names)

# 3. Explore --------------------------------------------------------------
str(empleadores)
names(sindicatos)

sjPlot::plot_frq(sindicatos$g25)

sjPlot::plot_frq(sindicatos$g28_4) #discriminacion por genero
sjPlot::plot_frq(sindicatos$g28_2)
sjPlot::plot_frq(sindicatos$d4_8)
sjPlot::plot_frq(sindicatos$g6_6)
sjPlot::plot_frq(sindicatos$h2_3)

sjPlot::plot_frq(sindicatos$g4_1) #presiden
sjPlot::plot_frq(sindicatos$g4_2)
sjPlot::plot_frq(sindicatos$g4_3)
sjPlot::plot_frq(sindicatos$g8_3)


# Feminizada
sind_fem <- sindicatos %>% filter(empresa_feminizada == 1)
sjPlot::plot_frq(sind_fem$g4_1)
sjPlot::plot_frq(sind_fem$g4_2)
sjPlot::plot_frq(sind_fem$g4_3)
sjPlot::plot_frq(sind_fem$g8_3)

sjPlot::plot_frq(sind_fem$g28_4) #discriminacion por genero
sjPlot::plot_frq(sind_fem$g28_2)
sjPlot::plot_frq(sind_fem$d4_8) # Menos que siempre 
sjPlot::plot_frq(sind_fem$g6_6)

sjPlot::plot_frq(sind_fem$h2_3)
