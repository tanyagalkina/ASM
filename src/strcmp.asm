    BITS    64
    global strcmp:function
    ;int strcmp(const char *s1, const char *s2);
    ;The  strcmp()  function compares the two strings s1 and s2.  It returns
    ;   an integer less than, equal to, or greater than zero if  s1  is  found,
    ;   respectively, to be less than, to match, or be greater than s2.
    ;
    ;

    section .text

strcmp:
        mov rax, -1
        ret