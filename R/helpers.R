# function to get created and modified dates for a dataset_key
get_created_modified <- function(dataset_key) {
  url <- paste0("https://api.gbif.org/v1/dataset/", dataset_key)
  
  resp <- httr::GET(url)
  
  if (httr::status_code(resp) == 200) {
    json <- jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))
    tibble(
      created = json$created,
      modified = json$modified
    )
  } else {
    tibble(
      created = NA_character_,
      modified = NA_character_
    )
  }
}

