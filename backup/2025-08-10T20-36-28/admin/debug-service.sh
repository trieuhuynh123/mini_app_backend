#!/bin/sh
#
 # Copyright 2022 youngmonkeys.org
 # 
 # Licensed under the ezyplatform, Version 1.0.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 # 
 #     https://youngmonkeys.org/licenses/ezyplatform-1.0.0.txt
 # 
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
#

ADMIN_SERVER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PID_FILE=$ADMIN_SERVER_HOME/.runtime/admin_server_instance.pid

if [ $JAVA_HOME ]
then
	echo "JAVA_HOME found at $JAVA_HOME"
	RUN_JAVA=$JAVA_HOME/bin/java
else
	echo "JAVA_HOME environment variable not available."
    RUN_JAVA=`which java 2>/dev/null`
fi

if [ -z $RUN_JAVA ]
then
    echo "JAVA could not be found in your system."
    echo "please install Java 1.6 or higher!!!"
    exit 1
fi

#### vm options
if [ -f "$ADMIN_SERVER_HOME/vm-options.txt" ]; then
    while IFS='=' read -r key value; do
        case "$key" in
            MIN_HEAP_SIZE) MIN_HEAP_SIZE="$value" ;;
            MAX_HEAP_SIZE) MAX_HEAP_SIZE="$value" ;;
        esac
    done < "$ADMIN_SERVER_HOME/vm-options.txt"
fi

if [ "x$MIN_HEAP_SIZE" != "x" ]; then
	JAVA_OPTS="$JAVA_OPTS -Xms${MIN_HEAP_SIZE}"
fi

if [ "x$MAX_HEAP_SIZE" != "x" ]; then
	JAVA_OPTS="$JAVA_OPTS -Xmx${MAX_HEAP_SIZE}"
fi

JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote"
JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote.port=1099 -Djava.net.preferIPv4Stack=true"
JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote.rmi.port=1099"
JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote.local.only=false"
JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote.authenticate=false"
JAVA_OPTS="${JAVA_OPTS} -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1 -Djava.rmi.activation.port=1099"

CLASSPATH="lib/*:admin/lib/*:admin/settings:admin/resources:$1"

echo "########################################"
echo "# RUN_JAVA=$RUN_JAVA"
echo "# JAVA_OPTS=$JAVA_OPTS"
echo "# CLASSPATH=$CLASSPATH"
echo "# starting now...."
echo "########################################"

mkdir -p $ADMIN_SERVER_HOME/.runtime

if [ -f ${PID_FILE} ]; then
    PID=$(cat "${PID_FILE}");
fi

if [ -z "${PID}" ]; then
    echo "Process id for admin server instance is written to file: $PID_FILE"
    java $JAVA_OPTS -cp $CLASSPATH $JAVA_OPTS org.youngmonkeys.ezyplatform.admin.AdminStartup > /dev/null 2>&1 &
    echo $! > ${PID_FILE}
else
    echo "Another admin server instance is already started in this folder. To start a new instance, please run in a new folder."
    exit 0
fi
