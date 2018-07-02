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
#-server -XX:+UseParallelGC -XX:+DisableExplicitGC -XX:PermSize=32M -XX:MaxPermSize=125m -Xms1024m -Xmx2500m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/ -XX:+PrintClassHistogram -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintHeapAtGC -Xloggc:/tmp/gc.log  -cp $CLASSPATH ${SERVICE_CLASS} &
#		pid=`ps auxww|grep felix|grep -v grep|awk '{print $2}'`
#		if [ -n "$pid" ];
#		then
#		{
#		   echo "====netstat -anp|grep java >/tmp/nststat$pid.txt"
#		   netstat -anp|grep java >/tmp/nststat$pid.txt
#		   ps H -eo user,pid,ppid,tid,time,%cpu --sort=%cpu |grep $pid >/tmp/threadcpu$pid.txt
#		   /usr/local/jdk1.6.0_35/bin/jstack $pid >/tmp/jstack$pid.txt
#		   echo "==dump_memrry=="
#		   /usr/local/jdk1.6.0_35/bin/jmap -dump:live,file=/tmp/dump_$pid.bin $pid
#		   echo "======to shutdown the Core Felix Service========"
#		   echo "shutdown"|exec nc localhost 7710
#		   sleep 4
#                   echo "======to kill the Sm@rtLBS pid $pid========"
#                   kill -9 $pid
#                   sleep 2
#		}
#		fi
case "$1" in
	start)
       ${JAVACMD} -server -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/ -Dfile.encoding=UTF-8 -cp $CLASSPATH ${SERVICE_CLASS} &
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
