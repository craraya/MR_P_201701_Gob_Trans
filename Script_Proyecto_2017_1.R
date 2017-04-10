
##
## Scrtipt Marcela
##

library(rvest)
library(RCurl)
library(XML)
library(dplyr)
library(stringr)

url <- c('http://www.gobiernotransparentechile.gob.cl/directorio/entidad/1/1/per_planta/Ao-2017?x=0&y=0&page_number=1&sort=id&direction=asc'
        ,'http://www.gobiernotransparentechile.gob.cl/directorio/entidad/1/1/per_planta/Ao-2017?x=0&y=0&page_number=2&sort=id&direction=asc'
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/2/2/per_planta/2017/Febrero?x=0&y=0&page_number=1&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/2/2/per_planta/2017/Febrero?x=0&y=0&page_number=2&sort=id&direction=asc"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/2/343/per_planta/A%C3%B1o%202017/Febrero"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=1&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=2&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=3&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=4&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=5&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=6&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=7&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=8&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/3/90/per_planta/Ao-2017?x=0&y=0&page_number=9&sort=id&direction=asc"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/4/285/per_planta/2017/Febrero?x=0&y=0&page_number=1&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/4/285/per_planta/2017/Febrero?x=0&y=0&page_number=2&sort=id&direction=asc"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/4/284/per_planta/2017/Febrero"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/4/99/per_planta/Ao-2010"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/5/115/per_planta/Ao-2017"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/6/126/per_planta/A%C3%B1o%202017/FEBRERO"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/7/128/per_planta/Ao-2017"
        
        ,"http://www.economia.cl/transparencia/2017/per_planta.html"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/8/349/per_planta/Ao-2017"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/8/131/per_planta/Ao-2017"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/9/347/per_planta/A%C3%B1o%202017/Febrero"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/9/348/per_planta/A%C3%B1o%202017/Febrero"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/356/per_planta/A%C3%B1o%202016/Agosto"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=1&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=2&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=3&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=4&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=5&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=6&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=7&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/10/146/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=8&sort=id&direction=asc"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/12/167/per_planta/A%C3%B1o%202017/Febrero"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/12/168/per_planta/Ao-2017-Programa-01"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/13/176/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=1&sort=id&direction=asc"
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/13/176/per_planta/A%C3%B1o%202017/Febrero?x=0&y=0&page_number=2&sort=id&direction=asc"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/18/263/per_planta/Ao-2017"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/19/268/per_planta"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/21/279/per_planta/Ao-2017"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/23/276/per_planta/Ao-2017"
        
        ,"http://www.gobiernotransparentechile.gob.cl/directorio/entidad/26/353/per_planta/A%C3%B1o%202016/agosto"
        
        )


## pruebas
length(url)
xml_file <- URLencode(url[3]) %>%
  getURL() %>%
  read_html()

tabla <-  html_node(xml_file, "table") %>%
  html_table(dec=",",fill=T)

head_1 <- html_node(xml_file, "title") %>%
  html_text()

token_1 <- str_locate_all(head_1,c("-",">"))[[1]][,1]
token_2 <- str_locate_all(head_1,c("-",">"))[[2]][,1]

Subsecretaria <- str_sub(head_1,start=token_1[2]+2,end=token_2-2)

############################################### fin pruebas
MF <- c()
for(i in 1:length(url)){
  #i=22
  xml_file <- URLencode(url[i]) %>%
    getURL() %>%
    read_html()
  
  tabla <-  html_node(xml_file, "table") %>%
    html_table(dec=",",fill=T)
  
  tabla <- tabla[!is.na(tabla[,1]),]
  
  head_1 <- html_node(xml_file, "title") %>%
    html_text()
  
  token_1 <- str_locate_all(head_1,c("-",">"))[[1]][,1]
  token_2 <- str_locate_all(head_1,c("-",">"))[[2]][,1]
  
  Subsecretaria <- str_sub(head_1,start=token_1[2]+2,end=token_2-2)
  if(i==22){ 
    Subsecretaria <- "Subsecretaría de Economía y Empresas de Menor Tamaño" 
    names(tabla) <- names(MF)[-1]
    }
  n <- nrow(tabla)
  
  MF <- rbind(MF,cbind(rep(Subsecretaria,n),tabla))
  
  print(paste(i," - OK"),sep="")
}

## Limpiamos algunas cosas
names(MF)[1] <- "Subsecretaria"
MF$`Remuneración Bruta Mensualizada` <- as.numeric(gsub("\\.","",MF$`Remuneración Bruta Mensualizada`))

save(MF,file="Datos.RData")
