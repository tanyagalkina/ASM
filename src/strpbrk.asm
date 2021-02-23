    BITS    64
    global strpbrk:function
    ;**************************************************
    ;char *strpbrk(const char *s, const char *accept);
    ;The strpbrk() function locates the first occurrence in the string s of any
    ;   of the bytes in the string accept.
    ;The strpbrk() function returns a pointer to the byte in s that matches one
    ;   of the bytes in accept, or NULL if no such byte is found.
    ;

    section .text

strpbrk:
        mov rax, rdi
        ret
