    BITS    64
    global strncmp:function
    ;The  strncmp()  function  is similar, except it compares only the first
    ;   (at most) n bytes of s1 and s2.

    ;int strncmp(const char *s1, const char *s2, size_t n);
    ;

    section .text

strncmp:

    xor rax, rax
    inc rax
    dec rax
    ret