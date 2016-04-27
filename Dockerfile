FROM ubuntu:14.04
MAINTAINER Denis Andrejew <da.colonel@gmail.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential xorg libssl-dev libxrender-dev wget xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz -O wkhtmltox.tar.xz && \
    tar xf wkhtmltox.tar.xz
ENTRYPOINT ["wkhtmltox/bin/wkhtmltopdf"]

CMD ["-h"]
