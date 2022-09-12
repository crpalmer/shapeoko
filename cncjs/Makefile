all: cncrc

install: all
	cp cncrc ~/cnc/

import:
	./extract-cncrc.sh < ~/cnc/cncrc

MACROS = \
    BitSetter_Initial_Tool.txt \
    BitSetter_New_Tool.txt \
    Probe_Edge_Left.txt \
    Probe_Edge_Right.txt \
    Probe_Edge_Bottom.txt \
    Probe_Edge_Top.txt \
    Probe_Hole.txt \
    Probe_Middle_X_from_Left.txt \
    Probe_Middle_Y_from_Top.txt  \
    Probe_Z_Parallels.txt \
    Probe_Z.txt \
    Probe_Z_Sacrificial.txt \
    Probe_Hole_Fast.txt \
    Probe_Use_0.25in_Probe.txt \
    Probe_Use_Touch_Probe.txt \


.DELETE_ON_ERROR:

cncrc: $(MACROS) build-cncrc.sh
	./build-cncrc.sh $(MACROS) >$@

clean:
	rm -f cncrc
