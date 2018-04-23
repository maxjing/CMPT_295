
all:	x

x:	main.o fill.o
	gcc -o x main.o fill.o

main.o:	main.s
	gcc -g -c main.s

fill.o:	fill.s
	gcc -g -c fill.s

main.s:	main.c
	gcc -O2 -S main.c

fill.s:	fill.c
	gcc -O2 -S fill.c

clean:	
	rm -f x *.o *.s

