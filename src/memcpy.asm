    BITS    64
    global  memcpy:function
    ;*************************************************************
    ;void *memcpy(void *dest, const void *src, size_t n);
    ;The  memcpy()  function  copies  n bytes from memory area src to memory
    ;area dest.  The memory areas must not overlap.  Use memmove(3)  if  the
    ;memory areas do overlap.
    ;***The memcpy() function returns a pointer to dest.
    ;

    section .text

memcpy:
    enter 0, 0  ;
    xor rcx, rcx

    cmp rdi, 0 ; rdi stores 1st arg, DEST
    je  quit
    cmp rsi, 0 ; rsi stores 2nd arg, SOURCE
    je  quit
    cmp rdx, 0; size_t n
    je  quit; should i check if rdx value is < then 0? the type is unsigned...

loop:
    cmp byte[rsi + rcx], 0
    je quit
    cmp rcx, rdx
    je quit
    ;mov [rdi + rcx], [rsi + rcx] why it does not go? addressing modes?
    mov r9b, [rsi + rcx] ; copy to tpm
    mov [rdi + rcx], r9b ; copy to DEST[rcx]
    inc rcx
    jmp loop

quit:
    mov rax, rdi
    leave
    ret