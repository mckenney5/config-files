#!/bin/bash
# Displays the weather
ansiweather -l Hershey,USA, -a false -u imperial -s true -w false -h false -p false | awk '{print $5$6, $7}'
