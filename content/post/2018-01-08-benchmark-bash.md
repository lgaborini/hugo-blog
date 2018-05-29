---
title: Run the simplest CPU benchmark using a Docker image
author: Lorenzo Gaborini
date: "2018-01-08"
categories: ["coding"]
tags: ["Docker", "snippets"]
mathjax: true
---

### Ever needed a way to run a single-core benchmark on a machine?

From [this blog post](http://tuxshell.blogspot.ch/2009/08/bc-as-cpu-benchmark.html), the Linux calculator `bc` can be used as a benchmark tool with almost no requirements. We only need a Linux shell capable of running the command `time`, and of course `bc`.   

E.g. we can measure the time needed to compute \\(\pi\\) to 5000 digits:

    $ time echo "scale=5000; a(1)*4" | bc -l
    

Here's the output of my machine under WSL:

    bc -l  20.83s user 0.00s system 99% cpu 20.950 total
    

#### Docker image

The simplest benchmark can be associated to the [simplest Docker machine](https://hub.docker.com/r/lgaborini/benchmarkbash/).  
The image is only 5 MB in size!   

Here's the associated `Dockerfile`:
```docker
# A simple /bin/sh CPU benchmark using bc on alpine image
#
# From: http://tuxshell.blogspot.ch/2009/08/bc-as-cpu-benchmark.html

FROM alpine

RUN apk update && apk add bc

WORKDIR '/payload'
ADD benchmark_bc.sh .
CMD ["sh", "benchmark_bc.sh"]
```

where `benchmark_bc.sh` is a wrapper for the benchmark command ([source](https://github.com/lgaborini/benchmarkBash/blob/master/benchmark_bc.sh)).

```bash
#!/bin/sh
time sh -c 'echo "scale=5000; a(1)*4" | bc -l'
```

Sadly the wrapper is necessary to correctly pass `time` to the shell.

##### Usage

Usage is absolutely trivial:

```bash
docker run -it lgaborini/benchmarkbash
```
Notice that `alpine` uses `sh`, which outputs the time in a slightly different format:

    real    0m 26.09s
    user    0m 26.06s
    sys     0m 0.00s

### Links

- [GitHub repo](https://github.com/lgaborini/benchmarkBash)
- [Docker Hub repo](https://hub.docker.com/r/lgaborini/benchmarkbash/)