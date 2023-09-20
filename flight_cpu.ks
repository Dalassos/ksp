copypath("0:myLib/farc_api.ks","1:").
copypath("0:KSLib-master/library/lib_gui_box.ks","1:").

runoncepath(lib_gui_box).
runoncepath(farc_api).

clearscreen.
draw_gui_box(1,1,48,30).

PRINT "Craft info: " at (2,2).

PRINT "Wing area: " at (2,4).
PRINT calculateWingArea() + " m2" at (20,4).
PRINT "Weight: " at (2,5).
PRINT calculateWeight() + " kN" at (20,5).
PRINT "Min launch speed: " at (2,6).
PRINT  liftoffSpeed() + " m/s" at (20,6).

PRINT "Flight info: " at (2,8).



