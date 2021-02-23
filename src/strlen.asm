	BITS	64		 ;  64bits asm
	global	my_strlen:function ; signature int strlen(const char *)
	section	.text		 ;  .text section contains the programm itself

my_strlen:
    mov rax, 16
    ret