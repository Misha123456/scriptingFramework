#!/usr/bin/env bash
export ANT_OPTS='-Xmx512m -Dfile.encoding=UTF-8 -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005'
