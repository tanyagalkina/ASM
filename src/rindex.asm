    BITS    64
    global rindex:function
    ;
    ;char *rindex(const char *s, int c);
    ;The rindex() function returns a pointer to the last occurrence  of  the
    ;   character c in the string s.

    ;   The  terminating  null  byte  ('\0')  is considered to be a part of the
    ;   strings.
    ; The index() and rindex() functions return  a  pointer  to  the  matched
    ;  character or NULL if the character is not found.
    ;

    section .text

rindex:

    mov rax, rdi
    ret
