FROM overhangio/openedx:12.1.2

RUN pip install python-jose>=3.0.0

COPY yru.py /openedx/venv/lib/python3.8/site-packages/social_core/backends
COPY yru2.py /openedx/venv/lib/python3.8/site-packages/social_core/backends

RUN ls -lrt /openedx/venv/lib/python3.8/site-packages/social_core/backends

COPY register.underscore /openedx/edx-platform/lms/templates/student_account/
RUN ls -lrt /openedx/edx-platform/lms/templates/student_account/

COPY _accomplishment-rendering.html /openedx/edx-platform/lms/templates/certificates
RUN ls -lrt /openedx/edx-platform/lms/templates/certificates

RUN echo $(date) > /tmp/date.txt
