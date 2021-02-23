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
    xor	rax, rax
    mov rax, rdi ; I just return the str arg back for now))
    ret

