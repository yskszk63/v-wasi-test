WASI_SYSROOT = /opt/wasi-sdk/wasi-sysroot

.PHONY: all clean

all: test.wasm

test.wasm: hello.v
	v -cc clang -cflags '--target=wasm32-wasi --sysroot=$(WASI_SYSROOT) -I$(CURDIR)/stub -o $@' -o $@ $<

clean:
	$(RM) test.wasm
