FROM overhangio/openedx:12.2.0

RUN pip install python-jose>=3.0.0

COPY register.underscore /openedx/edx-platform/lms/templates/student_account/
COPY _accomplishment-rendering.html /openedx/edx-platform/lms/templates/certificates
COPY accomplishment-base.html /openedx/edx-platform/lms/templates/certificates

COPY openedx-theme /openedx-theme

COPY copy-files.bash copy-files.bash
RUN ./copy-files.bash

RUN echo $(date) > /tmp/date.txt
