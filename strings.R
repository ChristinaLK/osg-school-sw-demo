library(stringr)

mydir <- getwd()
path_components <- str_split(mydir, "/")[[1]]
wdname <- path_components[length(path_components)]
print(wdname)
