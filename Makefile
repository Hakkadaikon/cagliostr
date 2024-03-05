.PHONY: build clean

build: clean
	mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make cagliostr

clean:
	rm -rf build
