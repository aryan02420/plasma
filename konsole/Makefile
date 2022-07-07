.PHONY: install update uninstall

install_dir=$${XDG_DATA_DIR:-$$HOME/.local/share}/konsole

install:
	mkdir -p ${install_dir}
	install -m 600 ./{Tailwind,Lorikeet}.colorscheme ${install_dir}

update:
	install -m 600 ${install_dir}/{Tailwind,Lorikeet}.colorscheme .

uninstall:
	rm ${install_dir}/{Tailwind,Lorikeet}.colorscheme 
