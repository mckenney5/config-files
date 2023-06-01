batlvl: src/bat.tmux.c
	$(CC) -Wall -Ofast -o batlvl src/bat.tmux.c

search3: src/search3.c
	$(CC) -Wall -Ofast -o search3 src/search3.c

clean:
	rm batlvl
	rm search3

install: batlvl search3
	# Copying files from src
	cp -vi src/bashrc ~/.bashrc
	cp -vi src/tmux.conf ~/.tmux.conf
	cp -vi src/vimrc ~/.vimrc
	cp -vi src/bash_alias ~/.bash_alias
	# Copying batlvl to /usr/bin
	sudo cp -vi batlvl /usr/bin/
	# Copying search3 to /usr/bin
	sudo cp -vi search3 /usr/bin/
	# Copying weather.sh to /usr/bin
	sudo cp -vi src/weather.sh /usr/bin/
	# Copying temp.sh to /usr/bin
	sudo cp -vi src/temp.sh /usr/bin/
	# Copying online.sh to /usr/bin
	sudo cp -vi src/online.sh /usr/bin/

reinstall: batlvl search3
	# Copying files from src
	cp -vui src/bashrc ~/.bashrc
	cp -vui src/tmux.conf ~/.tmux.conf
	cp -vui src/vimrc ~/.vimrc
	cp -vui src/bash_alias ~/.bash_alias
	# Copying batlvl to /usr/bin
	sudo cp -vui batlvl /usr/bin/
	# Copying search3 to /usr/bin
	sudo cp -vui search3 /usr/bin/
	# Copying weather.sh to /usr/bin
	sudo cp -vui src/weather.sh /usr/bin/
	# Copying temp.sh to /usr/bin
	sudo cp -vui src/temp.sh /usr/bin/
	# Copying online.sh to /usr/bin
	sudo cp -vui src/online.sh /usr/bin/

