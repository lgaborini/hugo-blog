# Hooks to truncate output to max chars and max lines
#
#

# the default output hook
hook_output_default = knitr::knit_hooks$get('output')

truncate_to_lines <- function(x, n) {
   if (!is.null(n)) {
      x = unlist(stringr::str_split(x, '\n'))
      if (length(x) > n) {
         # truncate the output
         x = c(head(x, n), '...\n')
      }
      x = paste(x, collapse = '\n') # paste first n lines together
   }
   x
}

truncate_to_chars <- function(x, n_chars) {
   if (!is.null(n_chars)) {
      if (min(nchar(x), n_chars) < nchar(x)) {
         x <- substr(x, 1, min(nchar(x), n_chars))
         x <- paste(x, ' ...\n')
      }
   }
   x
}

knitr::knit_hooks$set(output = function(x, options) {
   max.lines <- options$max.lines
   x <- truncate_to_lines(x, max.lines)

   max.chars <- options$max.chars
   x <- truncate_to_chars(x, max.chars)

   hook_output_default(x, options)
})