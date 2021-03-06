#' Get OBIS EEZ id
#'
#' @export
#' @param x (character) An Exclusive Economic Zone name
#' @return An integer EEZ ID if a match found in list of EEZ's, or \code{NULL} if
#' no match found.
#' @examples \dontrun{
#' (res <- region_names())
#' obis_eez_id(res[[100]]$title)
#' }
obis_eez_id <- function(x) {
  eezs <- obis_eez()
  eezs[eezs$name %in% x, "id"] %&% NULL
}

obis_eez <- function() {
  rs <- getter(file.path(obis_base(), "eez"), format = "application/json;charset=UTF-8")
  jsonlite::fromJSON(rs)$results
}

obis_base <- function() "http://api.iobis.org"
