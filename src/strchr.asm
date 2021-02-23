	BITS	64
	global	strchr:function
        ;;;The  strchr() function returns a pointer to the first occurrence of the
       ;;;character c in the string s.
	;;;char *strchr(const char *s, int c);
	section .text
strchr:

	xor	rax, rax
    mov rax, rdi ; I just return the str arg back for now))
    ret
	
