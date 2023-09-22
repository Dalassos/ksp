copypath("0:myLib/farc_api.ks","1:").
copypath("0:KSLib-master/library/lib_gui_box.ks","1:").

runoncepath(lib_gui_box).
runoncepath(farc_api).

clearscreen.
draw_gui_box(1,1,48,30).

PRINT "Craft info: " at (2,2).

PRINT "Wing area: " at (2,4).
PRINT round(calculateWingArea(),2) + " m2" at (20,4).
PRINT "Weight: " at (2,5).
PRINT round(calculateWeight(),2) + " kN" at (20,5).
PRINT "Min launch speed: " at (2,6).
PRINT  round(liftoffSpeed(),2) + " m/s" at (20,6).

PRINT "Flight info: " at (2,8).

local InitAlti is ALTITUDE.
local Flying is FALSE.

UNTIL FALSE {
	if ALTITUDE < 15000 {
		if Flying = FALSE {
			PRINT "Ready for launch: " at (2,10).
			PRINT  round(ALTITUDE,2) + " m" at (20,10).
			set Flying to (ALTITUDE > (InitAlti+5)) OR ALTITUDE > 100 OR SHIP:GROUNDSPEED > 30.
		}
		else {
				PRINT "Min flight speed: " at (2,10).
				PRINT  round(liftoffSpeed(),2) + " m/s" at (20,10).
			}
		}
		WAIT 0.001.
}



