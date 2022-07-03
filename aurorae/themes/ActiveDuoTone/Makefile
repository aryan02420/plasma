.PHONY: deps generate install uninstall

install_dir=$${XDG_DATA_DIR:-$$HOME/.local/share}/aurorae/themes/ActiveDuoTone

deps:
	npm i

generate:
	node button_generator.js

install:
	mkdir -p ${install_dir}
	install -m 600 ./{alldesktops,close,help,keepabove,keepbelow,maximize,minimize,restore,shade}.svg ${install_dir}
	install -m 600 ./{ActiveDuoTonerc,decoration.svg,LICENSE,metadata.desktop} ${install_dir}

uninstall:
	rm -rf ${install_dir}
