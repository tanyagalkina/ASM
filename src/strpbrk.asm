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
    xor rax, rax
    xor rcx, rcx ; counter for  *s
    xor r12, r12 ; counter for *accept
    jmp loop

return_value:
    mov rax, rdi
    add rax, rcx
    ret

loop:
    cmp byte[rdi + rcx], 0
    je return_null ; it is actually the same as return_value
    cmp byte[rsi + r12], 0;  did not find the char in the accept string
    je step ; try next char
    mov r9b, byte[rdi + rcx]
    mov r8b, byte[rsi + r12]
    cmp r8b, r9b
    je return_value
    inc r12
    jmp loop

step:
    xor r12, r12
    inc rcx
    jmp loop

return_null:
    mov rax, 0
    ret
