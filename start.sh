#!/bin/bash

tz=$TZ;
if [[ -n $tz ]];
then 
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
fi

/usr/sbin/apache2ctl -D FOREGROUND

