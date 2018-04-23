
all:	x	
	
x:	main.o sum_roll.o
	gcc -o x main.o sum_roll.o

main.o:	main.s
	gcc -c main.s

main.s:	main.c 
	gcc -S -O2 -fno-builtin main.c

sum_roll.o:	sum_roll.s
	gcc -c sum_roll.s

sum_roll.s:	sum_roll.c 
	gcc -S -O2 -fno-builtin sum_roll.c

clean:	
	rm -f *.o *.s x
