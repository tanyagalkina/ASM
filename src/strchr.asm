	BITS	64
	global	strchr:function
        ;;;The  strchr() function returns a pointer to the first occurrence of the
       ;;;character c in the string s.
	;;;char *strchr(const char *s, int c);
	section .text

strchr:

    ;push	rbp			; Add a element to the stack
    ;mov	rbp,	rsp
    enter   0,0 ; just trying to replace the prev idiom of creating a stack frame
	xor	rcx, rcx
	cmp rdi, 0 ; check if str is NULL
	je  quit

loop:
    cmp [rdi + rcx], sil
    je  quit
    cmp byte[rdi + rcx], 0
    je  quit_null ;if the char is not found
    inc rcx
    jmp loop

quit_null:
    mov rax, 0
    leave
    ret

quit:
	add rdi, rcx
    mov rax, rdi ; I ;just return the str arg back for now))

    ;mov rsp, rbp
    ;pop rbp
    leave ; instead of the above stack frame idiom

    ret
	
