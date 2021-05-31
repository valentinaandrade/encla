# Code: Proc --------------------------------------------------------------
# 1. Load packages --------------------------------------------------------
pacman::p_load(tidyverse, readr, sjPlot, ggplot2, RColorBrewer)

theme_set(theme_sjplot2())

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

## Expandidos
sjPlot::plot_frq(sind_fem$h2_3, weight.by = sind_fem$fe_empresa)
sjPlot::plot_frq(sindicatos$h2_3, weight.by = sindicatos$fe_empresa)

## Corresponsabilidad
sjPlot::plot_frq(sind_fem$d4_8, weight.by = sind_fem$fe_empresa, show.n = F, show.ci = T, geom.colors = "mediumpurple",
                 errorbar.color = "black") +
  labs(x = "", y = "Frecuencia", title =" Empresas feminizada",caption = "Fuente: Elaboración propia en base a ENCLA (2019), datos ponderados.")

sjPlot::plot_frq(sindicatos$d4_8, weight.by = sindicatos$fe_empresa, show.n = F, show.ci = T, geom.colors = "skyblue",
                 errorbar.color = "black") +
  labs( y = "Frecuencia", title =" Empresas masculinizadas",caption = "Fuente: Elaboración propia en base a ENCLA (2019), datos ponderados.")


ggsave(plot = last_plot(),
       filename = "grafico4.2.png",
       device = "png",
       dpi = 500,
       units = "cm",
       width = 20,
       height = 15)

## Sindicatos

## Corresponsabilidad
sjPlot::plot_frq(sind_fem$g4_3, weight.by = sind_fem$fe_empresa, show.n = F, show.ci = T, geom.colors = "mediumpurple",
                 errorbar.color = "black") +
  labs(x = "", y = "Frecuencia", title =" Secretarias en empresas feminizada",caption = "Fuente: Elaboración propia en base a ENCLA (2019), datos ponderados.")

sjPlot::plot_frq(sindicatos$g4_3, weight.by = sindicatos$fe_empresa, show.n = F, show.ci = T, geom.colors = "skyblue",
                 errorbar.color = "black") +
  labs( y = "Frecuencia", title =" Secretarios en empresas en general",caption = "Fuente: Elaboración propia en base a ENCLA (2019), datos ponderados.")


ggsave(plot = last_plot(),
       filename = "grafico5.6.png",
       device = "png",
       dpi = 500,
       units = "cm",
       width = 20,
       height = 15)

## Expandidos
sjPlot::plot_frq(sind_fem$g28_2, weight.by = sind_fem$fe_empresa)
sjPlot::plot_frq(sindicatos$g28_2, weight.by = sindicatos$fe_empresa)

sjPlot::plot_frq(sind_fem$g6_6, weight.by = sind_fem$fe_empresa)
sjPlot::plot_frq(sindicatos$g6_6, weight.by = sindicatos$fe_empresa)
