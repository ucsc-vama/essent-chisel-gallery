default: top

include ../Makefrag-essent

generated_dir = $(abspath riscv-mini/generated-src)
fir_filename = Tile.fir
fir_path = $(abspath $(fir_filename))
src_dir = $(abspath riscv-mini/src/main/cc)

src_mm_source = $(src_dir)/mm.cc
src_mm_header = $(src_dir)/mm.h

CXXFLAGS = -O3 -std=c++11
INCLUDES = -I../firrtl-sig -I$(src_dir)

# clone the riscv-mini submodule
riscv-mini/README.md:
	git submodule update --init riscv-mini

# generate .fir file using riscv-mini submodule
$(generated_dir)/$(fir_filename): riscv-mini/README.md
	cd riscv-mini; make compile 

# copy generated .fir file to maing working area
$(fir_filename): $(generated_dir)/$(fir_filename)
	cp $(generated_dir)/$(fir_filename) .

# execute essent on the .fir to generate the .h for the emulator
Tile.h: $(fir_filename) $(ESSENT_JAR)
	$(ESSENT) -O3 $(fir_path)

# build the emulator
top: top.cc $(src_mm_source) $(src_mm_header) Tile.h
	$(CXX) $(CXXFLAGS) $(INCLUDES) top.cc $(src_mm_source) -o top 

.PHONY: test
test: top
	./top riscv-mini/src/test/resources/towers.riscv.hex

clean:
	rm top Tile.h $(fir_filename)
