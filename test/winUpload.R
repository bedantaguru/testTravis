
if(!requireNamespace("RCurl", quietly = TRUE)) install.packages("RCurl")
if(!requireNamespace("pkgbuild", quietly = TRUE)) install.packages("pkgbuild")

built_path <- pkgbuild::build()

links <- paste0("ftp://win-builder.r-project.org/", c("R-devel", "R-release", "R-oldrelease"), "/", basename(built_path))

lapply(links, RCurl::ftpUpload, what = built_path)

