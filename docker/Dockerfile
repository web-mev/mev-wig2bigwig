From ubuntu:jammy

RUN apt-get update &&\
  apt-get install -y wget libcurl4-openssl-dev

# Install all software under /opt/software:
RUN mkdir -p /opt/software && mkdir -p /opt/software/resources

RUN wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig -P /opt/software && \
    chmod +x /opt/software/wigToBigWig

ADD run.sh /opt/software/
ADD mm39_chr_sizes.txt /opt/software/resources/
ADD hg38_chr_sizes.txt /opt/software/resources/
ADD grcm39_chr_sizes.txt /opt/software/resources/
ADD grch38_chr_sizes.txt /opt/software/resources/

RUN chmod +x /opt/software/run.sh
