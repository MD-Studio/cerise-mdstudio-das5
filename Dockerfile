FROM mdstudio/cerise:develop
MAINTAINER Felipe Zapata <f.zapata@esciencecenter.nl>

COPY api /home/cerise/api
RUN chown -R cerise:cerise /home/cerise/api

COPY known_hosts /home/cerise/.ssh/
RUN chown -R cerise:cerise /home/cerise/.ssh/known_hosts
