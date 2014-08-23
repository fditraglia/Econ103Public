require(knitr)
match.rmd <- glob2rx("*.Rmd")
rmd.list <- list.files(".", match.rmd)
for(i in 1:length(rmd.list)){
  purl(rmd.list[i], documentation = 0)
}
rm(list = ls())