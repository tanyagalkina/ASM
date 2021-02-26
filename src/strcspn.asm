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
    xor rcx, rcx ; reset counter
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
    xor r12, r12
    cmp byte[rdi + rcx], 0 ; while (s[i] != '\0') ;
    ;mov al, byte[r12 + 1]
    je away
    mov bl,  byte[rdi + rcx];nto -> tpm
    inc rcx
    jmp is_in

away:
    mov rax, rcx
    ;mov rax, r12
   	leave
    ret

