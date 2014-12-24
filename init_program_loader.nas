	ORG 0x7c00
	
	JMP entry
	DB 0x00
	DB "zmdollos";启动区名称
	DW 512;每个扇区的大小
	DB 1;簇的大小,簇是相对于文件系统来说的
	DW 1;FAT开始的位置
	DB 2;FAT的个数
	DW 224;根目录个数
	DW 2880;总扇区数
	DB 0xf0;磁盘种类
	DW 9;FAT的长度
	DW 18;每个磁道有18个扇区
	DW 2;磁头个数
	DD 0;不分区
	DD 2880;
	DB 0,0,0x29;
	DD 0xffffffff;
	DB "zm doll os ";磁盘名称
	DB "FAT12   ";磁盘格式
	RESB 18
entry:
	MOV		AX,0
	MOV 	SP,0x7c00
	MOV		DS,AX
	MOV		ES,AX
	MOV 	SI,msg
output:
	MOV		AL,[SI]
	ADD		SI,1
	CMP		AL,0
	JE		fin
	MOV		AH,0x0e
	MOV 	BX,15
	INT		0x10
	JMP		output
fin:
	HLT
	JMP		fin
msg:
	DB		0x0a,0x0a
	DB		"hello, world"
	DB		0x0a
	DB		0
	RESB	0x7dfe-$
	DB 		0x55,0xaa