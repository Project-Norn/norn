FILE=hoge.vd

build:
	cat ./src/stdlib.vd ./src/${FILE} > ./tmp/${FILE}
	./bin/sigrun --tse ./tmp/${FILE} ./tmp/tmp.s
	./bin/rota ./tmp/tmp.s ./tmp/tmp.o
	./bin/rota ./src/crt0.s ./tmp/crt0.o
	./bin/herja ./tmp/crt0.o ./tmp/tmp.o ./a.out

run: build
	./bin/eir ./a.out

build-gnu:
	cat ./src/stdlib.vd ./src/${FILE} > ./tmp/${FILE}
	./bin/sigrun ./tmp/${FILE} ./tmp/tmp.s
	as ./tmp/tmp.s -o ./tmp/tmp.o
	as ./src/crt0.s -o ./tmp/crt0.o
	ld ./tmp/crt0.o ./tmp/tmp.o -o ./a.out

run-gnu: build-gnu
	./a.out; echo $$?

init:
	mkdir -p bin src tmp
	cp ../sigrun/target/debug/sigrun ./bin/
	cp ../rota/target/debug/rota ./bin/
	cp ../herja/target/debug/herja ./bin/
	cp ../eir/target/debug/eir ./bin/

.PHONY: build run init
