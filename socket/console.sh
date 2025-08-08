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

EZYFOX_SERVER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo 'current dir: ' $EZYFOX_SERVER_HOME

#### vm options
if [ -f "$EZYFOX_SERVER_HOME/vm-options.txt" ]; then
    while IFS='=' read -r key value || [ -n "$key" ]; do
        case "$key" in
            MIN_HEAP_SIZE) MIN_HEAP_SIZE="$value" ;;
            MAX_HEAP_SIZE) MAX_HEAP_SIZE="$value" ;;
        esac
    done < "$EZYFOX_SERVER_HOME/vm-options.txt"
fi

if [ "x$MIN_HEAP_SIZE" != "x" ]; then
	JAVA_OPTS="$JAVA_OPTS -Xms${MIN_HEAP_SIZE}"
fi

if [ "x$MAX_HEAP_SIZE" != "x" ]; then
	JAVA_OPTS="$JAVA_OPTS -Xmx${MAX_HEAP_SIZE}"
fi

CLASSPATH="lib/*:settings:socket/lib/*:socket/settings:$1"

echo "########################################"
echo "# JAVA_OPTS=$JAVA_OPTS"
echo "# CLASSPATH= $CLASSPATH"
echo "# starting now...."
echo "########################################"

java -cp $CLASSPATH org.youngmonkeys.ezyplatform.socket.SocketStartup $EZYFOX_SERVER_HOME/settings/socket.properties
