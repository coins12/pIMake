CC= gcc
SRC= ${wildcard *.c}

TRG= ${SRC:.c=}

.PHONY: all
all: ${TRG}

CFLAGS= -Wall -Werror -O2 -std=gnu99

%: %.c
	${CC} ${CFLAGS} -o $@ $^

.PHONY: clean
clean: ${TRG} 
	rm $^ ${TRG:=.dump}

rep: ${TRG}
	@for t in "${TRG}"; do\
	 ./$$t \< $${t}.test > $${t}.dump;\
	 done
	
