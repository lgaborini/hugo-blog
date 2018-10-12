---
title: "CRAN Hugo shortcodes"
draft: false
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


### CRAN badges

Similarly, one can insert CRAN badges for a package using the following shortcode:

```html
<a href="https://cran.r-project.org/package={{ .Get 0 }}" class="image-link"><img src="https://www.r-pkg.org/badges/version/{{ .Get 0 }}"></img></a>
```

Save it as `layouts/shortcodes/cran-badge.html` as before.

A badge for the {{<cran dplyr>}} package {{<cran-badge dplyr>}} can be inserted as follows:


```golang
{{</* cran-badge dplyr */>}}
```

To remove the link underline for some Hugo themes, you have to add and tweak your `image-link` CSS class to the `/static/css/custom.css` file:

```css
.image-link {
   border-bottom: 0 !important;
}
```

[Minimo](https://minimo.netlify.com/) inserts the underline by modifying the `border-bottom` property. Other themes might do otherwise, e.g. by changing `text-decoration`. Just find what works on your theme!

