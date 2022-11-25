all: cncrc

install: all
	cp cncrc ~/cnc/

import:
	./extract-cncrc.sh < ~/cnc/cncrc

MACROS = \
    gen/Probe_Tool.json \
    gen/Probe_Edge_Left.json \
    gen/Probe_Edge_Right.json \
    gen/Probe_Edge_Bottom.json \
    gen/Probe_Edge_Top.json \
    gen/Probe_Hole.json \
    gen/Probe_Middle_X_from_Left.json \
    gen/Probe_Middle_Y_from_Top.json  \
    gen/Probe_Z_Parallels.json \
    gen/Probe_Z.json \
    gen/Probe_Z_Sacrificial.json \
    gen/Probe_Hole_Fast.json \


.DELETE_ON_ERROR:

all: cncrc gsender-macros.json

cncrc: $(MACROS) build-cncrc.sh
	./build-cncrc.sh --cncrc $(MACROS) >$@

gsender-macros.json: $(MACROS) build-cncrc.sh
	./build-cncrc.sh $(MACROS) >$@

gen/%.json: %.txt
	mkdir -p gen
	echo "$< ...."
	./build-json.sh $< > $@

clean:
	rm -rf cncrc gsender-macros.json gen
