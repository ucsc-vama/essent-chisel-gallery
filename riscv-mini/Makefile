# Run Rocket Chip to get .fir (FIRRTL) file of design

generated_dir = $(abspath riscv-mini/generated-src)
fir_filename = Tile.fir
fir_path = $(abspath $(fir_filename))
src_dir = $(abspath riscv-mini/src/main/cc)

src_mm_source = $(src_dir)/mm.cc
src_mm_header = $(src_dir)/mm.h

riscv-mini/README.md:
	git submodule update --init riscv-mini

$(generated_dir)/$(fir_filename): riscv-mini/README.md
	cd riscv-mini; make compile 

$(fir_filename): $(generated_dir)/$(fir_filename)
	cp $(generated_dir)/$(fir_filename) .


Tile.h: $(fir_filename)
	cd ../essent; sbt 'run -O3 $(fir_path)'; cd ../riscv-mini; rm Tile.fir;


CXXFLAGS = -O3 -std=c++11
INCLUDES = -I../firrtl-sig	-I../riscv-mini/riscv-mini/src/main/cc

top: top.cc $(src_mm_source) $(src_mm_header) Tile.h
	$(CXX) $(CXXFLAGS) $(INCLUDES) top.cc $(src_mm_source) -o top 

clean:
	rm Tile.h top