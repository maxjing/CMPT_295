
x:	main.o conv.o
	gcc -o x conv.o main.o

main.o:	main.s
	gcc -c main.s

conv.o:	conv.s
	gcc -c conv.s

main.s:	main.c
	gcc -O2 -S main.c

clean:
	rm -f x *.o main.s
