all: cncrc

install: all
	cp cncrc ~/.cncrc

import:
	./extract-cncrc.sh < ~/.cncrc

MACROS = \
    gen/Prb_Tool.json \
    gen/Prb_Insert_Probe.json \
    gen/Prb_Left_Edge.json \
    gen/Prb_Right_Edge.json \
    gen/Prb_Bottom_Edge.json \
    gen/Prb_Top_Edge.json \
    gen/Prb_Hole.json \
    gen/Prb_Mid_X_from_Left.json \
    gen/Prb_Mid_Y_from_Top.json  \
    gen/Prb_Z_Parallels.json \
    gen/Prb_Z.json \
    gen/Prb_Z_Tape.json \
    gen/Prb_Find_Z.json \
    gen/Prb_Find_X_Left.json \
    gen/Prb_Find_X_Right.json \
    gen/Prb_Find_Y_Bottom.json \
    gen/Prb_Find_Y_Top.json

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
