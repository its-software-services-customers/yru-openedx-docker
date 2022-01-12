FROM overhangio/openedx:12.1.2

RUN pip install python-jose>=3.0.0

COPY register.underscore /openedx/edx-platform/lms/templates/student_account/
COPY _accomplishment-rendering.html /openedx/edx-platform/lms/templates/certificates
COPY accomplishment-base.html /openedx/edx-platform/lms/templates/certificates

#COPY openedx-theme/html/* /openedx/edx-platform/lms/templates/
#COPY openedx-theme/html/courseware/* /openedx/edx-platform/lms/templates/courseware/
#COPY openedx-theme/html/dashboard/* /openedx/edx-platform/lms/templates/dashboard/
#COPY openedx-theme/html/header/* /openedx/edx-platform/lms/templates/header/

#openedx-theme/html
COPY openedx-theme/html/course.html /openedx/edx-platform/lms/templates/
COPY openedx-theme/html/courses_list.html /openedx/edx-platform/lms/templates/
COPY openedx-theme/html/dashboard.html /openedx/edx-platform/lms/templates/
COPY openedx-theme/html/footer.html /openedx/edx-platform/lms/templates/ 
COPY openedx-theme/html/index.html /openedx/edx-platform/lms/templates/
COPY openedx-theme/html/index_overlay.html /openedx/edx-platform/lms/templates/
COPY openedx-theme/html/main.html /openedx/edx-platform/lms/templates/
#openedx-theme/html/courseware
COPY openedx-theme/html/courseware/courses.html /openedx/edx-platform/lms/templates/courseware/
#openedx-theme/html/dashboard
COPY openedx-theme/html/dashboard/_dashboard_course_listing.html /openedx/edx-platform/lms/templates/dashboard/
#openedx-theme/html/header
COPY openedx-theme/html/header/brand.html /openedx/edx-platform/lms/templates/header/
COPY openedx-theme/html/header/header.html /openedx/edx-platform/lms/templates/header/
COPY openedx-theme/html/header/navbar-authenticated.html /openedx/edx-platform/lms/templates/header/
COPY openedx-theme/html/header/navbar-logo-header.html /openedx/edx-platform/lms/templates/header/
COPY openedx-theme/html/header/user_dropdown.html /openedx/edx-platform/lms/templates/header/

COPY openedx-theme/images/* /openedx/staticfiles/images/
COPY openedx-theme/css/* /openedx/staticfiles/css/vendor/

RUN echo $(date) > /tmp/date.txt
