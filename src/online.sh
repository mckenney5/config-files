#!/bin/bash
# checks if we have an IP assigned to us

if [ -z $(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) ]
then
	printf "#[fg=red]OFFLINE#[default]"
else
	printf "#[fg=green]ONLINE#[default]"
fi

