batlvl: src/bat.tmux.c
	$(CC) -Wall -Ofast -o batlvl src/bat.tmux.c

c2f:	src/c2f.c
	$(CC) -Wall -Ofast -o c2f src/c2f.c

clean:
	rm batlvl
	rm c2f

install: batlvl c2f weatherparse
	# Copying files from src
	cp -vi src/bashrc ~/.bashrc
	cp -vi src/tmux.conf ~/.tmux.conf
	cp -vi src/vimrc ~/.vimrc
	cp -vi src/bash_alias ~/.bash_alias
	# Copying fonts
	mkdir -p ~/.fonts
	cp -vi src/fonts/* ~/.fonts/
	# Copying batlvl to /usr/bin
	sudo cp -vi batlvl /usr/bin/
	# Copying c2f to /usr/bin
	sudo cp -vi c2f /usr/bin/
	# Copying weather.sh to /usr/bin
	sudo cp -vi src/weather.sh /usr/bin/
	# Copying temp.sh to /usr/bin
	sudo cp -vi src/temp.sh /usr/bin/
	# Copying online.sh to /usr/bin
	sudo cp -vi src/online.sh /usr/bin/

reinstall: batlvl c2f
	# Copying files from src
	cp -vui src/bashrc ~/.bashrc
	cp -vui src/tmux.conf ~/.tmux.conf
	cp -vui src/vimrc ~/.vimrc
	cp -vui src/bash_alias ~/.bash_alias
	# Copying fonts
	mkdir -p ~/.fonts
	cp -vui src/fonts/* ~/.fonts/
	# Copying i3 conf files
	mkdir -p ~/.i3
	cp -vui src/i3/* ~/.i3/
	cd ..
	# Copying batlvl to /usr/bin
	sudo cp -vui batlvl /usr/bin/
	# Copying c2f to /usr/bin
	sudo cp -vui c2f /usr/bin/
	# Copying weather.sh to /usr/bin
	sudo cp -vui src/weather.sh /usr/bin/
	# Copying temp.sh to /usr/bin
	sudo cp -vui src/temp.sh /usr/bin/
	# Copying online.sh to /usr/bin
	sudo cp -vui src/online.sh /usr/bin/

