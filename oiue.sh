#!/bin/sh

if [ "$JAVA_HOME" = "" ]; then
	JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-3.b12.el7_3.x86_64/jre/"
#	JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home/jre/"
fi
if [ "$SMARTLBS_HOME" = "" ]; then
	SMARTLBS_HOME="/work/github/main"
fi

JAVACMD="$JAVA_HOME/bin/java"
#-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000 
JAVADBG="$JAVA_HOME/bin/java -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
CLASS_HOME=""
SERVICE_CLASS="org.apache.felix.main.Main"

export LC_ALL=zh_CN.UTF-8

oldCP=$CLASSPATH

unset CLASSPATH
for i in ${SMARTLBS_HOME}/lib/*.jar ; do
  if [ "$CLASSPATH" != "" ]; then
    CLASSPATH=${CLASSPATH}:$i
  else
    CLASSPATH=$i
  fi
done
CLASSPATH=${CLASSPATH}:${MCC_HOME}/java/classes

if [ "$CLASS_HOME" != "" ]; then
  for i in ${CLASS_HOME}/* ; do
    if [ "$CLASSPATH" != "" ]; then
      CLASSPATH=${CLASSPATH}:$i
    else
      CLASSPATH=$i
    fi
  done
fi

if [ "$oldCP" != "" ]; then
    CLASSPATH=${CLASSPATH}:${oldCP}
fi

case "$1" in
	start)
       ${JAVACMD} -cp $CLASSPATH ${SERVICE_CLASS} &
		;;
	stop)
		pid=`ps auxww|grep felix|grep -v grep|awk '{print $2}'`
		if [ -n "$pid" ];
		then
		{
		  echo "======to shutdown the Core Felix Service========"
		  echo "shutdown"|nc localhost 7710
		  sleep 4
		  echo "======to kill the Sm@rtLBS pid $pid========"
		  kill -9 $pid
		  sleep 2
		}
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	status)
		#${JAVACMD} -cp $CLASSPATH ${SERVICE_CLASS} -f ${DST_CONF} -status
		;;
	version)
		#${JAVACMD} -cp $CLASSPATH ${SERVICE_CLASS} -f ${DST_CONF} -version
		;;
	submit)
		#if [ `whoami` = "mcc" ]; then
		#	${JAVACMD} -cp $CLASSPATH ${CFG_CLASS} $2 $3
		#fi
		;;
	verify)
		#if [ `whoami` = "mcc" ]; then
		#	$0 submit -v ${SRC_XCONF}
		#fi
		;;
	convert)
		#if [ `whoami` = "mcc" ]; then
		#	$0 submit -c ${SRC_XCONF}
		#fi
		;;
	frcnv)
		#if [ `whoami` = "mcc" ]; then
		#	$0 submit -f ${SRC_XCONF}
		#fi
		;;
	debug)
		#if [ `whoami` = "mcc" ]; then
		#	echo $CLASSPATH
		#	${JAVADBG} -cp $CLASSPATH ${SERVICE_CLASS} -f ${DST_CONF}&
		#fi
		${JAVADBG} -cp $CLASSPATH ${SERVICE_CLASS} &
		;;
	*)
		echo "Usage: $0 {start|stop|restart|status|verify|convert|frcnv}"
esac

exit 0
