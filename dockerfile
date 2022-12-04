FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /Info550Project

WORKDIR /Info550Project

COPY .Rprofile .

RUN mkdir renv

COPY renv.lock .

COPY renv/settings.dcf renv

COPY renv/activate.R renv

COPY makefile .

COPY report.Rmd .

RUN mkdir Data

RUN mkdir Programs

RUN mkdir Report

COPY Programs/* Programs

COPY Data/* Data

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir Output

CMD make && mv report.html Report

