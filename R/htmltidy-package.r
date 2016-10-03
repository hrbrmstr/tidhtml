#' Tidy Up and Test XPath Queries on HTML and XML Content
#'
#' HTML documents can be beautiful and pristine. They can also be
#' wretched, evil, malformed demon-spawn. Now, you can tidy up that HTML and XHTML
#' before processing it with your favorite angle-bracket crunching tools, going beyond
#' the limited tidying that 'libxml2' affords in the 'XML' and 'xml2' packages and
#' taming even the ugliest HTML code generated by the likes of Google Docs and Microsoft
#' Word. It's also possible to use the functions provided to format or "pretty print"
#' HTML content as it is being tidied. Utilities are also included that make it
#' possible to view formatted and "pretty printed" HTML/XML
#' content from HTML/XML document objects, nodes, node sets and plain character HTML/XML
#' using 'vkbeautify' (by Vadim Kiryukhin) and 'highlight.js' (by Ivan Sagalaev).
#' Also (optionally) enables filtering of nodes via XPath or viewing an XML document
#' in "tree" view using 'xml-viewer' (by Julian Gruber). See
#' \url{https://github.com/vkiryukhin/vkBeautify} and
#' \url{https://github.com/juliangruber/xml-viewer} for more information about 'vkbeautify'
#' and 'xml-viewer', respectively.
#'
#' @name htmltidy
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @useDynLib htmltidy
#' @importFrom Rcpp sourceCpp
#' @import xml2 XML htmlwidgets htmltools
NULL
