FROM rocker/rstudio-stable:3.5.1

RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install \
        libxml2-dev \
        libcairo2-dev \
        libsqlite-dev \
        libmariadbd-dev \
        libmariadb-client-lgpl-dev \
        libpq-dev \
        libssh2-1-dev \
        libz-dev && \
    install2.r --error --deps TRUE \
        tidyverse \
        dplyr \
        devtools \
        formatR \
        remotes \
        selectr \
        BiocManager

RUN Rscript -e 'BiocManager::install("dada2", version = "3.8")'
RUN Rscript -e 'BiocManager::install("phyloseq", version = "3.8")'
