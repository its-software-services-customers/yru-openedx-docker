#!/bin/bash

SRC_DIR=/openedx-theme
CUSTOM_DIR=/openedx-custom
DEST_HTML=/openedx/edx-platform/lms/templates
DEST_STATIC=/openedx/staticfiles

find ${SRC_DIR}

echo "#### Start copy files ###"

cp ${CUSTOM_DIR}/register.underscore ${DEST_HTML}/student_account/
cp ${CUSTOM_DIR}/_accomplishment-rendering.html ${DEST_HTML}/certificates/
cp ${CUSTOM_DIR}/accomplishment-base.html ${DEST_HTML}/certificates/

cp ${SRC_DIR}/css/* ${DEST_STATIC}/css/vendor/
cp ${SRC_DIR}/images/* ${DEST_STATIC}/images/

cp -r ${SRC_DIR}/html/* ${DEST_HTML}/

echo "#### List files dest dir [${DEST_HTML}] ###"
find ${DEST_HTML}
