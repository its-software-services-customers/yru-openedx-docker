#!/bin/bash

SRC_DIR=/openedx-theme
DEST_HTML=/openedx/edx-platform/lms/templates
DEST_STATIC=/openedx/staticfiles

find ${SRC_DIR}

cp ${SRC_DIR}/css/* ${DEST_STATIC}/css/vendor/
cp ${SRC_DIR}/images/* ${DEST_STATIC}/images/

cp ${SRC_DIR}/html/* ${DEST_HTML}/
cp ${SRC_DIR}/html/courseware/* ${DEST_HTML}/courseware/
cp ${SRC_DIR}/html/discovery/* ${DEST_HTML}/discovery/
cp ${SRC_DIR}/html/header/* ${DEST_HTML}/header/
cp ${SRC_DIR}/html/dashboard/* ${DEST_HTML}/dashboard/
