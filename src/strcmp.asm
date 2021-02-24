    BITS    64
    global strcmp:function
    ;int strcmp(const char *s1, const char *s2);
    ;The  strcmp()  function compares the two strings s1 and s2.  It returns
    ;   an integer less than, equal to, or greater than zero if  s1  is  found,
    ;   respectively, to be less than, to match, or be greater than s2.
    ;
    ;int*****************++strcmp SOURCE_CODE::
         ;28 strcmp (p1, p2)
         ;29      const char *p1;
         ;30      const char *p2;
         ;31 {
         ;32   register const unsigned char *s1 = (const unsigned char *) p1;
         ;33   register const unsigned char *s2 = (const unsigned char *) p2;
         ;34   unsigned reg_char c1, c2;
         ;35
         ;36   do
         ;37     {
         ;38       c1 = (unsigned char) *s1++;
         ;39       c2 = (unsigned char) *s2++;
         ;40       if (c1 == '\0')
         ;41         return c1 - c2;
         ;42     }
         ;43   while (c1 == c2);
         ;44
         ;45   return c1 - c2;
         ;46 }


    section .text

strcmp:
    enter 0, 0 ; I dont really need to use the stack cause I dont use any local vars
    xor rcx, rcx
    jmp loop

returnc1c2:
    mov r13b, r9b
    sub r13b, r8b
    movsx rax, r13b ; sx suffix moves smaller regs to bigger
    jmp away

loop:
    mov	r9b, byte[rdi + rcx]	; c1 = (unsigned char) *s1++;
	mov	r8b, byte[rsi + rcx]	; c2 = (unsigned char) *s2++;
	cmp	r9b, 0 		            ; if (c1 == '\0')
	je	returnc1c2
	cmp	r9b, r8b	   	; while (c1 == c2);
	jne	returnc1c2
	inc	rcx			    ; i++
	jmp	loop

away:
    leave
    ret


