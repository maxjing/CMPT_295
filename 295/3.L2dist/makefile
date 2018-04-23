
all:	x

x:	main.o sqrt.o dist.o sumroot.o
	gcc -o x sqrt.o dist.o main.o sumroot.o

main.o:	main.s
	gcc -c main.s

sqrt.o:	sqrt.s
	gcc -g -c sqrt.s

dist.o:	dist.s
	gcc -g -c dist.s

sumroot.o:	sumroot.s
	gcc -g -c sumroot.s

main.s:	main.c
	gcc -fno-builtin -O2 -S main.c

clean:	
	rm -f x *.o main.s
