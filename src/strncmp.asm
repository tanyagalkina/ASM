    BITS    64
    global strncmp:function
    ;The  strncmp()  function  is similar, except it compares only the first
    ;   (at most) n bytes of s1 and s2.

    ;int strncmp(const char *s1, const char *s2, size_t n);
    ;

    section .text



strncmp:
    enter 0, 0 ; I dont really need to use the stack cause I dont use any local vars
    xor rcx, rcx
    xor rax, rax
    cmp rdx, 0
    je away
    dec rdx
    jmp loop

returnc1c2:
    mov r13b, r9b
    sub r13b, r8b
    movsx rax, r13b ; sx suffix moves smaller regs to bigger
    jmp away

loop:
    mov	r9b, byte[rdi + rcx]	; c1 = (unsigned char) *s1++;
	mov	r8b, byte[rsi + rcx]	; c2 = (unsigned char) *s2++;
	cmp	r9b, 0 		            ; if (c1 == '\0')
	je	returnc1c2
    cmp rcx, rdx
    je  returnc1c2
	cmp	r9b, r8b	   	; while (c1 == c2);
	jne	returnc1c2
	inc	rcx			    ; i++
	jmp	loop

away:
    leave
    ret


