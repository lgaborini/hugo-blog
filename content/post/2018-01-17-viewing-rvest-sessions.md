---
title: "Viewing scraped HTML sessions from rvest and friends"
draft: true
categories: ["coding"]
tags: ["R", "rvest"]
date: "2018-01-17"
---

Hadley Wickham's excellent `rvest` R package is an extremely easy way to scrape any HTML page.    
It also provides limited utilities to do the scraping interactively: 

- `html_session`, which actually starts a browsing session in R interpreter,
- `back`, `follow_link`, `jump_to` implement page navigation using history or link selectors (CSS/XPath)
- `html_nodes` accept `session` objects and return HTML nodes in `rvest`-friendly format

However, there is no easy way to see the code which is actually parsed.  
Since `rvest` uses `httr` to make HTML requests, returned code can be very different from what is seen on a browser.

Similar issues exist even if you use other R packages such as `httr` (which, basically, deals only with the HTTP requests), `curl` or `RCurl` (same, but the hard way!).

In this post, we provide some quick functions to access the HTML code and view it in a browser. We will also learn how to exploit the S3 object system in R to help us!

## `rvest`

Suppose that we have just scraped a page:
`r 
library(rvest)
url <- 'https://nghttp2.org/httpbin/'
s <- rvest::html_session(url)`

`s` holds the scraped page, we can access the code using `xml2::read_html()`:

`r
s %>% xml2::read_html()`
