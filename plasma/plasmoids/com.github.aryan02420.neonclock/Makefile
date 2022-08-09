.PHONY: install test uninstall

install_dir=$${XDG_DATA_DIR:-$$HOME/.local/share}/plasma/plasmoids/com.github.aryan02420.neonclock

install:
	mkdir -p ${install_dir}
	install -m 600 ./metadata.json ${install_dir}
	cp -r ./contents ${install_dir}

test:
	plasmawindowed com.github.aryan02420.neonclock

uninstall:
	rm  -rf ${install_dir}
