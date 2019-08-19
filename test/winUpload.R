
if(!requireNamespace("RCurl", quietly = TRUE)) install.packages("RCurl")

built_path <- list.files(pattern = "testTravis_[0-9.]+.tar.gz", full.names = T)
if(length(built_path)>0){
  built_path <- normalizePath(max(built_path))
  links <- paste0("ftp://win-builder.r-project.org/", c("R-devel", "R-release", "R-oldrelease"), "/", basename(built_path))
  fup <- function(url) {
    i <- 0
    e <- NULL
    repeat({
      i<-i + 1
      e<- try(RCurl::ftpUpload(what = built_path, to = url), silent = TRUE)
      if(inherits(e, "try-error")){
        Sys.sleep(1)
      }else{
        cat("Uploaded for:", url, "\n")
        break()
      }
      if(i>10) break()
    })
    e
  }
  lapply(links, fup)
}

'built_path <- list.files(pattern = "testTravis_[0-9.]+.tar.gz", full.names = T)
if(length(built_path)>0){
  built_path <- normalizePath(max(built_path))
  links <- paste0("ftp://win-builder.r-project.org/", c("R-devel", "R-release", "R-oldrelease"), "/", basename(built_path))
  fup <- function(url) {
    i <- 0
    e <- NULL
    repeat({
      i<-i + 1
      e<- try(RCurl::ftpUpload(what = built_path, to = url), silent = TRUE)
      if(inherits(e, "try-error")){
        Sys.sleep(1)
      }else{
        cat("Uploaded for:", url, "\n")
        break()
      }
      if(i>10) break()
    })
    e
  }
  lapply(links, fup)
}' -> x

require(stringr)

x %>% str_split("\n") %>% unlist() %>% str_trim() %>% paste0(collapse = ";") %>% cat()
