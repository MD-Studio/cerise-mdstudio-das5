FROM mdstudio/cerise-mdstudio-base:0.3.0

RUN apt-get update && apt-get install -y wget

COPY api /home/cerise/api
RUN chown -R cerise:cerise /home/cerise/api

COPY known_hosts /home/cerise/.ssh/
RUN chown -R cerise:cerise /home/cerise/.ssh/known_hosts

COPY conf/config.yml /home/cerise/conf/config.yml
