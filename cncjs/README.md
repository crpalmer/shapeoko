CNCjs ( / gSender) Macros
=========================

These macros are being tested using CNCjs but theoretically should
work exactly the same with gSender.

If you are using Linux from the command line, you can modify the
macros and configuration locally and run

   make install

to generate a new cncrc that will be copied to ~/.cncrc.  If you have
modified the macros and events managed by this Makefile within cncjs,
you can copy the changes from ~/.cncrc to these files by running

   make import

If you are modifying the macros/config in CNCjs, you must
modify the global config in

   Settings (icon on left side of screen) >> Events >> Ready to Start

This configuration will be loaded automatically when a new connection
to the machine is initiated.  If you are using gSender, you will have
to modify the macro

   Controller Ready

AND YOU MUST REMEMBER TO RUN THIS MACRO EVERY TIME YOU CONNECT TO THE
MACHINE!

Tool length measurement:
------------------------

WHEN THE MACHINE IS FIRST TURNED ON, YOU MUST MEASURE THE TOOL LENGTH.

If you have an end mill loaded in the spindle, run: Prb Tool

If you have the touch probe loaded in the spind, run: Probe Insert Probe

Every time you change tools / touch probe, you must run the corresponding
macro to update the tool length.  If you every change a tool without running
the macro, you current Z zero will be incorrect.  If this happens, you'll
need to run one of the two macros and then set a new Z zero.

Settings zeros:
---------------

The other macros that start with Prb_ all set corresponding zeros.

Finding edges:
--------------

The macros that start with Find_ will all report the position of the corresponding
edge.

Edge Naming:
------------

If you were standing in front of the machine looking straight down at a rectangular
piece of stock on the machine the 4 sides are:

                  Top
         +------------------+
   left  |                  | right
         +------------------+
                 Bottom

and therefore Prb Top Edge will move the y gantry toward the front of the machine
looking for the top edge of the stock.

