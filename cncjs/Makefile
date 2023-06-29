all: cncrc

install: all
	cp cncrc ~/.cncrc

import:
	./extract-cncrc.sh ~/.cncrc

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
    gen/Find_Z.json \
    gen/Find_X_Left.json \
    gen/Find_X_Right.json \
    gen/Find_Y_Bottom.json \
    gen/Find_Y_Top.json \
    gen/dump_global_state.json

EVENTS = \
    ControllerReady.txt

GSENDER_EVENTS = \
    gen/ControllerReady.json

.DELETE_ON_ERROR:

all: cncrc gsender-macros.json

cncrc: $(MACROS) $(EVENTS) build-cncrc.sh
	./build-cncrc.sh --cncrc $(MACROS) >$@

gsender-macros.json: $(MACROS) $(GSENDER_EVENTS) build-cncrc.sh
	./build-cncrc.sh $(MACROS) $(GSENDER_EVENTS) >$@

gen/%.json: %.txt
	mkdir -p gen
	echo "$< ...."
	./build-json.sh $< > $@

clean:
	rm -rf cncrc gsender-macros.json gen
