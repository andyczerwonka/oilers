teamRecord <- function(w, l, otl) {
  all <- cbind(w, l, otl)
  apply(format(all), 1, paste, collapse = "-")
}
