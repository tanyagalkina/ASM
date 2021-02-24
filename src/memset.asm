    BITS    64
    global  memset:function
    ;void *memset(void *s, int c, size_t n);
    ;The  memset()  function  fills  the  first
    ;n  bytes of the memory area
    ;pointed to by s with the constant byte c.
    ;The memset() function returns a pointer to the memory area s.
    ;

    section .text

memset:
    enter   0, 0
    xor rcx , rcx
    cmp rdi, 0 ; check if 1st arg is null
    je quit

loop:
    cmp rcx, rdx
    je  quit
    cmp byte[rdi + rcx], 0; check if it is the end of string to prevent the undifuned behavior!
    je  quit
    mov byte[rdi + rcx], sil ; %rsi	2nd argument, callee-owned	%esi	%si	%sil
    inc rcx
    jmp loop

quit:
    mov rax, rdi ; I just return the str arg back))
    leave
    ret

