
x:	main.o test.o
	gcc -o x test.o main.o

main.o:	main.s
	gcc -c main.s

mystery.o:	test.s
	gcc -c test.s

main.s:	main.c
	gcc -O2 -S main.c

clean:	
	rm -f x *.o main.s
