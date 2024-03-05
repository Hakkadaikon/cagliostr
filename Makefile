.PHONY: ninja debug-ninja build debug-build clean

ninja: clean
	time bash -c "mkdir build && cd build && cmake -G Ninja -DCMAKE_BUILD_TYPE=Release .. && cmake --build ."

debug-ninja: clean
	time bash -c "mkdir build && cd build && cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug .. && cmake --build ."

build: clean
	time bash -c "mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && cmake --build ."

debug-build: clean
	time bash -c "mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && cmake --build ."

clean:
	rm -rf build
