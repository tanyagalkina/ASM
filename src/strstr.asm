    BITS    64
    global strstr:function
    ;
    ;The  strstr() function finds the first occurrence of the substring nee‐
    ;   dle in the string haystack.  The terminating null bytes ('\0') are  not
    ;  compared.
    ; These functions return a pointer to the beginning of the  located  sub‐
    ;   string, or NULL if the substring is not found.
    ;********************************************************+
    ; char *strstr(const char *haystack, const char *needle);


    section .text


strstr:
    mov rax, rsi
    ret
