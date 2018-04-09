#!/bin/bash
#
# tomcat7
#
# chkconfig:
# description:  Start up the Tomcat servlet engine.
# Source function library.
#. /etc/init.d/functions
export JAVA_OPTS="-XX:HeapDumpOnOutOfMemoryError -XX:HeapDumpPath="/usr/local/HeapDump""
RETVAL=$?
CATALINA_HOME="/opt/tomcat"
case "$1" in
 start)
        if [ -f $CATALINA_HOME/bin/startup.sh ]; then
                 echo $"Starting Tomcat"
           sudo su tomcat $CATALINA_HOME/bin/startup.sh
        fi
                 ;;
 stop)
        if [ -f $CATALINA_HOME/bin/shutdown.sh ]; then
                 echo $"Stopping Tomcat"
           sudo su tomcat $CATALINA_HOME/bin/shutdown.sh
        fi
                ;;
 restart)
        sudo su tomcat $CATALINA_HOME/bin/shutdown.sh
        sudo su tomcat $CATALINA_HOME/bin/startup.sh
        ;;
 *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
exit $RETVAL
