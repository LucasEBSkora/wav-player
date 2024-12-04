FIRMWARE ?= firmware
HARDWARE ?= soc-wav
BOARD ?= ulx3s

.PHONY: clean

all: make

make:
	make -C firmware $(FIRMWARE) DEFINES="-DHWFBUFFER"
ifeq ($(BOARD),verilator)
	silice-make.py -s hardware/$(HARDWARE).si -b $(BOARD) -p basic,oled -o build $(ARGS)
else
	silice-make.py -s hardware/$(HARDWARE).si -b $(BOARD) -p basic,audio,oled,buttons,sdcard -o build $(ARGS)
endif

clean:
	make -C firmware clean
	rm -rf BUILD_*
	rm -f *.lpp
