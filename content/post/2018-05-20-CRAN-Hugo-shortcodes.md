---
title: "CRAN Hugo shortcodes"
draft: true
categories: ["blog"]
date: "2018-05-21"
tags: ["blog"]
---

Lately, I have been testing [Hugo](https://gohugo.io/) as a blogging platform.

It is **very** R-friendly thanks to R package {{<cran blogdown>}}: as a result, you can write both in Markdown (`.md`) and in R Markdown (`.Rmd`), to create interactive blog posts.

### CRAN links

The first issue I encountered was the necessity to insert links to a CRAN package without copy-pasting the whole link everywhere.    
This was the first occasion to experiment with Hugo shortcodes!

In short, save the following line to the file `layouts/shortcodes/cran.html` in your Hugo tree:

```html
<a href="https://cran.rstudio.com/web/packages/{{ .Get 0 }}/">{{ .Get 0 }}</a>
```

Then, to make a link to the `blogdown` package, you can simply write

```golang
{{</* cran blogdown */>}}
```
somewhere in your post.    

And here is the result: {{<cran blogdown>}}

