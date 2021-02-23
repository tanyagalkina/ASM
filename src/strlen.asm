	BITS	64		 ;  64bits asm
	global	strlen:function ; signature int strlen(const char *)
	section	.text		 ;  .text section contains the programm itself

strlen:
    ;push rbp
    ;mov rbp, rsp
    xor rcx, rcx

loop:
    cmp byte[rdi + rcx], 0x00
    je end
    inc rcx
    jmp loop

end:
    mov rax, rcx

    ;mov rsp, rbp ; epilog
    ;pop rbp; epilog ... what WAS in this rbp?? ah ... my string
    ret
