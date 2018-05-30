---
title: "knitr, rmarkdown, HTML and Bootstrap"
categories: ["coding"]
tags: ["R", "knitr", "rmarkdown"]
date: "2018-02-28"
draft: true
---

## Introduction

For those of you who are not familiar with R, R Markdown is a framework to write dynamical documents using R. 
The markup language is a flavor of Markdown, which allows you to mix markup statements with R code.   
Markdown is easily readable by humans, yet it provides a minimal set of instructions to apply some automatic content formatting.  
Example: this blog is written in Markdown, but I also currently use R Markdown to quickly take notes (as glorified `.txt` files, basically).

The R packages [`knitr`](https://cran.r-project.org/web/packages/knitr/index.html) and [`rmarkdown`](https://cran.r-project.org/web/packages/rmarkdown/index.html) (now heavily integrated into [RStudio IDE](https://rmarkdown.rstudio.com/)), greatly enhance the reporting experience, allowing for an **enormous** freedom in statements, input and output formats, and kinds of reports (thanks [Yihui Xie](https://yihui.name/knitr/)!). 

With `knitr` and `rmarkdown`, R Markdown documents (`.Rmd`) can be effortlessly translated to HTML pages, PDF (with $$\LaTeX$$ formatting!), Word documents, but also more dynamic formats (slides, basically), or entire websites, book websites or blogs. 
See [here](https://rmarkdown.rstudio.com/formats.html) and [here](https://rmarkdown.rstudio.com/gallery.html) for some examples.

What's more, `rmarkdown` processes Rmarkdown files using [Pandoc](http://pandoc.org/MANUAL.html#pandocs-markdown) (a tool to convert between document formats), which further extends available commands.

The sheer amount of options, tools and functions is *so* enormous that each time I use R Markdown, I still discover something new. 
Also, the documentation is not perfect: the packages have greatly evolved, so it is quite easy to find functions that are now obsolete, or not documented at all.

So, here's the goal for this post: show something I have learned in the meantime, hoping it will be useful to someone!

## Input formats

`knitr` was originally built to process R Markdown files (`.Rmd`), run embedded R code chunks, and output a document (standard markdown `.md`, but also `.html`) with the chunks substituted.

`rmarkdown` extends the process: the function [`rmarkdown::render`](https://www.rdocumentation.org/packages/rmarkdown/versions/1.8/topics/render) is able to understand R Markdown code from usual `.Rmd` files, but also **R scripts** (`.R`). It then produces the output in the desired format.   

As a consequence, you can decide to write R markdown with embedded R code chunks (if you plan to write lots of markup text), or to enhance your R scripts with very pretty comments!

Here is the same script written under the two formats:

#### Base: R Markdown with R chunks (`.Rmd`)

~~~md
---
title: "Sample"
author: "Lorenzo G"
date: "`r Sys.Date()`"
output: 
  html_document
---

```{r setup, include=FALSE}
# Remove knitr progressbar
knitr::opts_knit$set(progress = FALSE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. 
For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

Here is some R code with a plot:

```{r cars}
summary(cars)
plot(pressure)
```

~~~


#### Base: R script with R markdown (`.R`)

~~~r
#' ---
#' title: "Sample"
#' author: "Lorenzo G"
#' date: "`r Sys.Date()`"
#' output: 
#'   html_document
#' ---
#'
#+ setup, include=FALSE
# Remove knitr progressbar
knitr::opts_knit$set(progress = FALSE)

#' 
#' ## R Markdown
#' 
#' This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. 
#' For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
#' 
#' Here is some R code with a plot:
#' 
#+ cars
summary(cars)
plot(pressure)

~~~

Notice how Markdown markup is prefixed by `#'` in R scripts, and how *alien* code chunks are fenced (triple backtick in R markdown, `#+` in R scripts).  
The big advantage of the second form is that it stays an R script and can be sourced (although with some bizarre formatting)!

In both cases, `rmarkdown::render` renders the script as an HTML file: [here]({{ "/./assets/sample_Rmd/sample_Rmd.html" }}) the results.


## Markdown goodies

As I said before, `rmarkdown` package processes Markdown code using Pandoc.

## Page goodies

Rendered HTML pages include the Bootstrap CSS into the header.

That means, you can use Bootstrap components with very minimal effort!