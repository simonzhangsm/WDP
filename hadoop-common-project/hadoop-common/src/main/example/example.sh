#!/bin/bash

if [ -z "$HADOOP" ]; then
	`dirname $0`/../../sbin/setenv.sh
fi
export HADOOP_VERSION=`hadoop version | sed -n "/^Hadoop/p" | awk '{ print $NF }'`

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-${HADOOP_VERSION}.jar pi 2 5
hdfs dfs -put -f $HADOOP_HOME/share/example/file1.txt $HADOOP_HOME/share/example/file2.txt /data
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-${HADOOP_VERSION}.jar wordcount /data /output