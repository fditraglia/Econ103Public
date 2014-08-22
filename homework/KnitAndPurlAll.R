require(knitr)
f <- list.files(".", "*.Rnw")
for(i in 1:length(f)){
  knit(f[i])
  purl(f[i], documentation = 0)
}
quit(save = "no")