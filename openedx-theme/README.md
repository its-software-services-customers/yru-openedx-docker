Readme

css/*     		----->      /openedx/staticfiles/css/vendor/
images/*		----->	/openedx/staticfiles/images/
html/*		----->	/openedx/edx-platform/lms/templates/

cd css 
docker cp . tutor_local-lms-1:/openedx/staticfiles/css/vendor/
cd ..
cd html
docker cp . tutor_local-lms-1:/openedx/edx-platform/lms/templates/
cd ..
cd images
docker cp . tutor_local-lms-1:/openedx/staticfiles/images/