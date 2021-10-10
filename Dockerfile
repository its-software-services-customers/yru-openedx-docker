FROM overhangio/openedx:12.1.2

RUN pip install python-jose>=3.0.0

COPY yru.py /openedx/venv/lib/python3.8/site-packages/social_core/backends
RUN ls -lrt /openedx/venv/lib/python3.8/site-packages/social_core/backends

RUN echo $(date) > /tmp/date.txt
