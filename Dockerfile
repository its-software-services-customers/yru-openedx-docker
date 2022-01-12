FROM overhangio/openedx:12.1.2

RUN pip install python-jose>=3.0.0

COPY register.underscore /openedx/edx-platform/lms/templates/student_account/
COPY _accomplishment-rendering.html /openedx/edx-platform/lms/templates/certificates
COPY accomplishment-base.html /openedx/edx-platform/lms/templates/certificates

COPY openedx-theme/html/* /openedx/edx-platform/lms/templates/
COPY openedx-theme/html/courseware/* /openedx/edx-platform/lms/templates/courseware/
COPY openedx-theme/html/dashboard/* /openedx/edx-platform/lms/templates/dashboard/
COPY openedx-theme/html/header/* /openedx/edx-platform/lms/templates/header/

COPY openedx-theme/images/* /openedx/staticfiles/images/
COPY openedx-theme/css/* /openedx/staticfiles/css/vendor/

RUN echo $(date) > /tmp/date.txt
