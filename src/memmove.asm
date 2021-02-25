    BITS    64
    global memmove:function
    ;
    ;void *memmove(void *dest, const void *src, size_t n);
    ;The  memmove()  function  copies n bytes from memory area src to memory
    ;   area dest.  The memory areas may overlap: copying takes place as though
    ;   the  bytes in src are first copied into a temporary array that does not
    ;   overlap src or dest, and the bytes are then copied from  the  temporary
    ;   array to dest.
    ;The memmove() function returns a pointer to dest.
    ;

;my memcpy already uses tmp... so try this
memmove:
    enter 0, 0  ;
    xor rcx, rcx

    cmp rdi, 0 ; rdi stores 1st arg, DEST
    je  quit
    cmp rsi, 0 ; rsi stores 2nd arg, SOURCE
    je  quit
    cmp rdx, 0; size_t n
    je  quit; should i check if rdx value is < then 0? the type is unsigned...

loop:
    cmp byte[rsi + rcx], 0
    je quit
    cmp rcx, rdx
    je quit
    ;****************;mov [rdi + rcx], [rsi + rcx] why it does not go? addressing modes?
    mov r9b, [rsi + rcx] ; copy to tpm
    mov [rdi + rcx], r9b ; copy to DEST[rcx]
    inc rcx
    jmp loop

quit:
    mov rax, rdi
    leave
    ret