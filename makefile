batlvl: src/bat.c
	$(CC) -Wall -Ofast -o batlvl src/bat.c
clean:
	rm batlvl 

install: batlvl
	# Copying files from src
	cp -vi src/bashrc ~/.bashrc
	cp -vi src/tmux.conf ~/.tmux.conf
	cp -vi src/vimrc ~/.vimrc
	# Copying fonts
	mkdir -p ~/.fonts
	cp -vi src/fonts/* ~/.fonts/
	# Copying i3 conf files
	mkdir -p ~/.i3
	cp -vi src/i3/* ~/.i3/
	# Copying batlvl to usr/bin
	sudo cp -vi batlvl /usr/bin/

reinstall: batlvl
	# Copying files from src
	cd src
	cp -vui src/bashrc ~/.bashrc
	cp -vui src/tmux.conf ~/.tmux.conf
	cp -vui src/vimrc ~/.vimrc
	# Copying fonts
	mkdir -p ~/.fonts
	cp -vui src/fonts/* ~/.fonts/
	# Copying i3 conf files
	mkdir -p ~/.i3
	cp -vui src/i3/* ~/.i3/
	cd ..
	# Copying batlvl to usr/bin
	sudo cp -vui batlvl /usr/bin/

