    BITS    64
    global strstr:function
    extern strlen ;; it does not work so trivial((((
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
    enter 0, 0
    xor rcx, rcx  ; set 1stcounter for the stack str
    xor r12, r12  ; set 2nd counter for the needle str
    xor rax, rax  ; set return to zero

big_loop:
    cmp byte[rdi + rcx], 0 ; if we are at the end of the stack string
    je not_found
    mov r9b, byte[rsi + r12] ; needle str
    add r12, rcx
    mov r8b, byte[rdi + r12] ; stack str
    cmp r9b, 0 ; if the needle string came until the end
    je found
    cmp r9b, r8b
    jne schift
    sub r12, rcx
    inc r12
    jmp big_loop

schift:
    xor r12, r12
    inc rcx
    jmp big_loop

found:
    mov rax, [rdi + rcx] 
    leave
    ret

not_found:
    mov rax, 0
    leave
    ret