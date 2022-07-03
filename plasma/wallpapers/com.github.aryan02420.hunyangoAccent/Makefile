.PHONY: install uninstall

install_dir=$${XDG_DATA_DIR:-$$HOME/.local/share}/plasma/wallpapers/com.github.aryan02420.hunyangoAccent

install:
	mkdir -p ${install_dir}
	install -m 600 ./metadata.{desktop,json} ${install_dir}
	cp -r ./contents ${install_dir}

uninstall:
	rm  -rf ${install_dir}
