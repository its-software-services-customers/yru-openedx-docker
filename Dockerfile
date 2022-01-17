FROM overhangio/openedx:12.2.0

COPY openedx-theme /openedx-theme
COPY openedx-custom /openedx-custom

COPY copy-files.bash copy-files.bash
RUN ./copy-files.bash

ENV REGISTRATION_VALIDATION_RATELIMIT "100000/1m"
ENV REGISTRATION_RATELIMIT "100000/1m"

RUN echo $(date) > /tmp/date.txt
