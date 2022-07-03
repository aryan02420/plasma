.PHONY: install update uninstall

install_dir=$${XDG_DATA_DIR:-$$HOME/.local/share}/color-schemes

install:
	install -m 600 ./BreezeDarker.colors ${install_dir}

update:
	install -m 600 ${install_dir}/BreezeDarker.colors .

uninstall:
	rm ${install_dir}/BreezeDarker.colors 
