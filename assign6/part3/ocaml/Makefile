all: graph.native

BUILD = corebuild
FLAGS = -use-ocamlfind -use-menhir

%.native: always
	$(BUILD) $(FLAGS) $@

clean:
	rm -rf *.native *.top _build

always:

.PHONY: always
