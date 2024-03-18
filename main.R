library(tercen)
library(dplyr)

ctx <- tercenCtx()

ctx  %>% 
  select(.ci, .ri) %>% 
  bind_cols(ctx$select(ctx$labels)) %>% 
  setNames(c(".ci", ".ri", "Barcode")) %>% 
  group_by(.ri, .ci) %>% 
  mutate(article = substr(Barcode, 1,3),
         run = substr(Barcode, 4,6),
         carrier = substr(Barcode, 7,7),
         strip = substr(Barcode,8,9)) %>% 
  ungroup() %>% 
  ctx$addNamespace() %>%
  ctx$save()

 