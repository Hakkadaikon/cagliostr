.PHONY: ninja debug-ninja build debug-build clean format

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

# format (use clang)
format:
	@clang-format -i \
		-style="{    \
			BasedOnStyle: Google,                      \
			AlignConsecutiveAssignments: true,         \
			AlignConsecutiveDeclarations: true,        \
			ColumnLimit: 0,                            \
			IndentWidth: 4,                            \
			AllowShortFunctionsOnASingleLine: None,    \
			AllowShortLoopsOnASingleLine: false,       \
			BreakBeforeBraces: Linux,                  \
			SortIncludes: false,                       \
			DerivePointerAlignment: false,             \
			PointerAlignment: Left,                    \
			AlignOperands: true,                       \
		}"                                                 \
		$(shell find src/ -name '*.cpp' -o -name '*.hpp')  \
		$(shell find src/ -name '*.cxx' -o -name '*.hxx')  \
		$(shell find src/ -name '*.c' -o -name '*.h'    )
