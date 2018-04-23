
x:	main.o prac1.o
	gcc -o x prac1.o main.o

main.o:	main.s
	gcc -c main.s

main.s:	main.c
	gcc -fno-builtin -O2 -S main.c

prac1.o:	prac1.s
	gcc -g -c prac1.s


clean:
	rm -f x *.o main.s
