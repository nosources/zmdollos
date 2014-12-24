default:
	..\tolset\z_tools\make.exe img
ipl.bin: init_program_loader.nas Makefile
	..\tolset\z_tools\nask.exe init_program_loader.nas ipl.bin ipl.lst
zmdollos.img: ipl.bin Makefile
	..\tolset\z_tools\edimg.exe imgin:..\tolset\z_tools\fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0 imgout:zmdollos.img
img: 
	..\tolset\z_tools\make.exe -r zmdollos.img
run: zmdollos.img Makefile
	..\tolset\z_tools\make.exe img
	copy zmdollos.img ..\tolset\z_tools\qemu\fdimage0.bin
	..\tolset\z_tools\make.exe -C ..\tolset\z_tools\qemu