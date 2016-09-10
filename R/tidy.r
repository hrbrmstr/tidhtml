#' Tidy HTML/XHTML Documents
#'
#' Currently supported options: \code{TidyAltText}, \code{TidyBodyOnly},
#' \code{TidyBreakBeforeBR}, \code{TidyCoerceEndTags}, \code{TidyCoerceEndTags},
#' \code{TidyDoctype}, \code{TidyDropEmptyElems}, \code{TidyDropEmptyParas},
#' \code{TidyFixBackslash}, \code{TidyFixComments}, \code{TidyHideComments},
#' \code{TidyHtmlOut}, \code{TidyIndentContent}, \code{TidyIndentSpaces},
#' \code{TidyJoinClasses}, \code{TidyJoinStyles}, \code{TidyLogicalEmphasis},
#' \code{TidyMakeBare}, \code{TidyMakeClean}, \code{TidyMark},
#' \code{TidyOmitOptionalTags}, \code{TidyReplaceColor}, \code{TidyTabSize},
#' \code{TidyUpperCaseAttrs}, \code{TidyUpperCaseTags}, \code{TidyWord2000},
#' \code{TidyWrapLen}, \code{TidyXhtmlOut}
#'
#' @param content atomic character or raw vector of content to tidy
#' @param options named list of options
#' @return tidied HTML/XHTML content
#' @references \url{https://github.com/htacg/tidy-html5/blob/master/include/tidyenum.h}
#'  (for definitions of the options supported above).
#' @export
tidy_html <- function(content, options=list(TidyXhtmlOut=TRUE)) {
  UseMethod("tidy_html")
}

#' @export
#' @rdname tidy_html
tidy_html.default <- function(content, options=list(TidyXhtmlOut=TRUE)) {
  content <- content[1]
  .Call('htmltidy_tidy_html_int', PACKAGE='htmltidy',
        source=content, options=options)
}

#' @export
#' @rdname tidy_html
tidy_html.character <- function(content, options=list(TidyXhtmlOut=TRUE)) {
  content <- content[1]
  .Call('htmltidy_tidy_html_int', PACKAGE='htmltidy',
        source=content, options=options)
}

#' @export
#' @rdname tidy_html
tidy_html.raw <- function(content, options=list(TidyXhtmlOut=TRUE)) {
  content <- content[1]
  content <- iconv(readBin(content, character()), to="UTF-8")
  out <- .Call('htmltidy_tidy_html_int', PACKAGE='htmltidy',
               source=content, options=options)
  charToRaw(out)
}

#' @export
#' @rdname tidy_html
tidy_html.xml_document <- function(content, options=list(TidyXhtmlOut=TRUE)) {
  content <- toString(content)
  out <- .Call('htmltidy_tidy_html_int', PACKAGE='htmltidy',
               source=content, options=options)
  xml2::read_html(out)
}

#' @export
#' @rdname tidy_html
tidy_html.HTMLInternalDocument <- function(content, options=list(TidyXhtmlOut=TRUE)) {
  content <- saveXML(content)
  out <- .Call('htmltidy_tidy_html_int', PACKAGE='htmltidy',
               source=content, options=options)
  XML::htmlParse(out)
}
