FROM overhangio/openedx:12.1.2

RUN pip install python-jose>=3.0.0

COPY register.underscore /openedx/edx-platform/lms/templates/student_account/
RUN ls -lrt /openedx/edx-platform/lms/templates/student_account/

COPY _accomplishment-rendering.html /openedx/edx-platform/lms/templates/certificates
RUN ls -lrt /openedx/edx-platform/lms/templates/certificates


RUN echo $(date) > /tmp/date.txt
