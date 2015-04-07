#! /bin/bash

# to make Heroku app not to become idle

for (( ; ; ))
do 
	curl -s http://lynxtoys.herokuapp.com/ > /dev/null
	sleep 30m
done
