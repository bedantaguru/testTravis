
b <- list.files(pattern = "tidycells_[0-9.]+.tar.gz", full.names = T)

if(length(b)>0){b <- normalizePath(max(b))

cat("Got", b, "\n")

lk <- paste0("ftp://win-builder.r-project.org/", c("R-devel", "R-release", "R-oldrelease"), "/", basename(b))

fup <- function(u) {i <- 0

e <- NULL

repeat({i<-i + 1

e<- try(RCurl::ftpUpload(what = b, to = u), silent = TRUE)

if(inherits(e, "try-error")){Sys.sleep(1)

  if(u!=lk[1]){e <- "failed"}}else{cat("Uploaded for:", u, "\n")

    break()

  }

if(i>50) break()

})

e}

lapply(lk, fup)}
