	ORG 0x7c00
	
	JMP entry
	DB 0x00
	DB "zmdollos";����������
	DW 512;ÿ�������Ĵ�С
	DB 1;�صĴ�С,����������ļ�ϵͳ��˵��
	DW 1;FAT��ʼ��λ��
	DB 2;FAT�ĸ���
	DW 224;��Ŀ¼����
	DW 2880;��������
	DB 0xf0;��������
	DW 9;FAT�ĳ���
	DW 18;ÿ���ŵ���18������
	DW 2;��ͷ����
	DD 0;������
	DD 2880;
	DB 0,0,0x29;
	DD 0xffffffff;
	DB "zm doll os ";��������
	DB "FAT12   ";���̸�ʽ
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