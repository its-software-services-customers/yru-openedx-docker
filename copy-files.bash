#!/bin/bash

SRC_DIR=/openedx-theme
CUSTOM_DIR=/openedx-custom
DEST_HTML=/openedx/edx-platform/lms/templates
DEST_STATIC=/openedx/staticfiles
PY_COMMON_ENV=/openedx/edx-platform/lms/envs/common.py

echo "#### List files [${SRC_DIR}] ###"
find ${SRC_DIR}

echo "#### List files [${CUSTOM_DIR}] ###"
find ${CUSTOM_DIR}

echo "#### Start copy files ###"

cp ${CUSTOM_DIR}/register.underscore ${DEST_HTML}/student_account/
cp ${CUSTOM_DIR}/_accomplishment-rendering.html ${DEST_HTML}/certificates/
cp ${CUSTOM_DIR}/accomplishment-base.html ${DEST_HTML}/certificates/

cp ${SRC_DIR}/css/* ${DEST_STATIC}/css/vendor/
cp ${SRC_DIR}/images/* ${DEST_STATIC}/images/

cp -r ${SRC_DIR}/html/* ${DEST_HTML}/

echo "#### List files dest dir [${DEST_HTML}] ###"
find ${DEST_HTML}

# https://discuss.openedx.org/t/registration-validation-endpoint-returning-403-in-lilac-rc1/5020
echo "REGISTRATION_VALIDATION_RATELIMIT = '100000/m'" >> ${PY_COMMON_ENV}
echo "REGISTRATION_RATELIMIT = '100000/m'" >> ${PY_COMMON_ENV}

