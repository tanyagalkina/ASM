    BITS    64
    global rindex:function
    extern strlen
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
    enter 0, 0
    xor rcx, rcx  ; set counter
    xor rax, rax  ; set return to zero
    cmp sil, 0
    jb return_null

call_strlen:
    push rdi
    call strlen wrt ..plt   ; PLT: procedure linkage table
    pop rdi
    mov rcx,  rax ; put the return value to the counter
    mov rax, 0

loop:
    cmp [rdi + rcx], sil
    je return_value
    cmp rcx, 0 ; came to the begining and did not found
    je return_null
    dec rcx
    jmp loop

return_value:
    mov rax, rdi
    add rax, rcx   ; return arg1[counter]
    leave
    ret

return_null:
    mov rax, 0
    leave
    ret