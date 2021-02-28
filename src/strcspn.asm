    BITS    64
    global strcspn:function
    extern rindex
    extern strlen
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
    enter 0, 0  ; why =? give some space maybe?
    mov rcx, -1
    xor rax, rax
    xor r12, r12
    jmp get_length_second

is_in:
        cmp byte[rsi + r12], 0 ; the end of reject == end of the loop
        je get_length_second
        cmp bl, byte[rsi + r12]
        je away
        inc r12
        jmp is_in


get_length_second:
    inc rcx
    xor r12, r12
    cmp byte[rdi + rcx], 0 ; while (s[i] != '\0') ;
    je away
    mov bl,  byte[rdi + rcx];nto -> tpm
    jmp is_in

found:
    mov rax, rcx
    inc rax
    leave
    ret

away:
    mov rax, rcx
   	leave
    ret

