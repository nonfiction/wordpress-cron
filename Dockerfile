FROM mysql:latest

# Install cron, curl and esh
RUN apt-get update && apt-get -y install cron curl
RUN curl -fsSL https://github.com/jirutka/esh/raw/master/esh > /bin/esh && chmod +x /bin/esh

# Create cron user (id 1000)
RUN echo password | adduser --home /cron cron 
ENV HOME /cron
WORKDIR /cron

# Add custom crontab
COPY ./crontab.esh /cron/crontab.esh

# Script to generate crontab and run cron in foreground
COPY ./run.sh /cron/run.sh
RUN chmod +x /cron/run.sh
CMD ["/cron/run.sh"]
