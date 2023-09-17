CC=clang

all: build clean

build:
	@echo "Compilando arquivos..."
	@$(CC) -pipe -Wall -O3 -fomit-frame-pointer -march=ivybridge  mandelbrot.clang-2.c -o mandelbrot.clang-2.gcc_run 

clean:
	@echo "Limpando..."
	@rm -f *.o
