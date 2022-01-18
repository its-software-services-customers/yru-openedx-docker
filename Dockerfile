FROM overhangio/openedx:12.2.0

COPY openedx-theme /openedx-theme
COPY openedx-custom /openedx-custom

COPY copy-files.bash copy-files.bash
RUN ./copy-files.bash

RUN echo $(date) > /tmp/date.txt

ENV TZ="Asia/Bangkok"
