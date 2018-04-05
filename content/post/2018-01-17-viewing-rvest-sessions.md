---
title: "Viewing scraped rvest HTML sessions"
draft: true
categories: ["coding"]
tags: ["R", "rvest"]
date: "2018-01-17"
---

Hadley Wickham's excellent `rvest` R package is an extremely easy to scrape any HTML page.

It also provides limited utilities to do the scraping interactively: 

- `html_session`, which actually starts a browsing session in R interpreter,
- `back`, `follow_link`, `jump_to` implement page navigation using history or link selectors (CSS/XPath)
- `html_nodes` accept `session` objects and return HTML nodes in `rvest`-friendly format

However, there is no easy way to see the code which is actually parsed.  
Since `rvest` uses `httr` to make HTML requests, returned code can be very different from what is seen on a browser.

`xml2::read_html` can be used to access the code
