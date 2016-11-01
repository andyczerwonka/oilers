teamRecord <- function(w, l, otl) {
  all <- cbind(w, l, otl)
  return(apply(format(all), 1, paste, collapse = "-"))
}
