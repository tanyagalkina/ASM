    BITS    64
    global strcasecmp:function
    ;int strcasecmp(const char *s1, const char *s2);
    ;The  strcasecmp()  function  performs  a byte-by-byte comparison of the
    ;strings s1 and s2, ignoring the case of the characters.  It returns  an
    ;integer  less  than,  equal  to,  or  greater than zero if s1 is found,
    ;respectively, to be less than, to match, or be greater than s2.
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

strcasecmp:
        xor rax, rax
        ret
