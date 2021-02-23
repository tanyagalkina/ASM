ASM	=	nasm

CC	=	gcc

RM	=	rm -f

ASFLAGS	=	-f elf64

NAME	=	libasm.so

SRCS	=	src/strlen.asm		\
            src/strchr.asm      \
            src/memset.asm      \
            src/memcpy.asm      \
            src/strcmp.asm      \
            src/memmove.asm     \
            src/strncmp.asm     \
            src/strcasecmp.asm  \
            src/rindex.asm      \
            src/strstr.asm      \
            src/strpbrk.asm     \
    		src/strcspn.asm

OBJS	=	$(SRCS:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -nostdlib -shared -fPIC $(OBJS) -o $(NAME)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re