FROM overhangio/openedx:12.1.2

RUN pip install python-jose>=3.0.0

COPY register.underscore /openedx/edx-platform/lms/templates/student_account/
COPY _accomplishment-rendering.html /openedx/edx-platform/lms/templates/certificates
COPY accomplishment-base.html /openedx/edx-platform/lms/templates/certificates

#COPY openedx-theme/html/* /openedx/edx-platform/lms/templates/
#COPY openedx-theme/images/* /openedx/staticfiles/images/
#COPY openedx-theme/css/* /openedx/staticfiles/css/vendor/

RUN echo $(date) > /tmp/date.txt
