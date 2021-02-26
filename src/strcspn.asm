    BITS    64
    global strcspn:function
    ;*************************************************
    ;size_t strcspn(const char *s, const char *reject);
    ;The strcspn() function calculates the length of the initial segment  of  s
    ;   which consists entirely of bytes not in reject.
    ;The strcspn() function returns the number of bytes in the initial  segment
    ;   of s which are not in the string reject.
    ;
    ;

    section .text

strcspn:
    mov rax, 1
    ret
