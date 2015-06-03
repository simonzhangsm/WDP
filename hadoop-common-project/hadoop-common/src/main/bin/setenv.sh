#!/bin/bash

OS=`uname -s`
if [ "$OS" == "Darwin" ]; then
	if [ ! -d $JAVA_HOME/Classes ]; then
		sudo mkdir $JAVA_HOME/Classes
		sudo ln -s $JAVA_HOME/lib/tools.jar $JAVA_HOME/Classes/classes.jar
	fi
	
	set Platform=x64
	
	port installed ocaml || sudo port install ocaml
	gem list -I cocoapods && sudo gem install cocoapods
	# install lastest libtools 
fi

if [ -z "$HADOOP" ]; then
	export HADOOP_HOME="$(cd `dirname $0`/..; pwd)"
	export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
fi

echo "HADOOP_HOME: "$HADOOP_HOME