" Disable print key for macvim
if has("gui_macvim")
	macmenu &File.Print key=<nop>
endif
