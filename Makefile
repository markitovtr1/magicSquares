
SHELL:=bash

all: solutions/naive.exe solutions/naive_O2.exe solutions/naive_unlooped.exe solutions/naive_unlooped_O2.exe solutions/Naive.class solutions/NaiveUnlooped.class

solutions/naive.exe: solutions/naive.c
	@gcc -Wno-unused-result solutions/naive.c -o solutions/naive.exe

solutions/naive_O2.exe: solutions/naive.c
	@gcc -Wno-unused-result -O2 solutions/naive.c -o solutions/naive_O2.exe

solutions/naive_unlooped.exe: solutions/naive_unlooped.c
	@gcc -Wno-unused-result solutions/naive_unlooped.c -o solutions/naive_unlooped.exe

solutions/naive_unlooped_O2.exe: solutions/naive_unlooped.c
	@gcc -Wno-unused-result -O2 solutions/naive_unlooped.c -o solutions/naive_unlooped_O2.exe

solutions/Naive.class: solutions/Naive.java
	@javac solutions/Naive.java

solutions/NaiveUnlooped.class: solutions/NaiveUnlooped.java
	@javac solutions/NaiveUnlooped.java

run: permutations.txt test.sh
	./test.sh 10

permutations.txt:
	@generator/permutations.py > permutations.txt

clean:
	@rm solutions/naive*.exe solutions/Naive*.class permutations.txt
