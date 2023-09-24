//air density in kg/m3
function airDensity {
	parameter alti is ALTITUDE.
	parameter atmos is BODY:ATM.

	local absTmp is atmos:ALTTEMP(alti).
	local absPrs is atmos:ALTITUDEPRESSURE(alti)*Constant:AtmToKPa*1000.
	local airDens is (absPrs*atmos:MOLARMASS/(CONSTANT:IdealGas*absTmp)).
	
	return airDens.
}

//wing area from FARC
function calculateWingArea {    
	local craftName is SHIP.
	
    local totalWingArea is 0.
    
	set totalWingArea to ADDONS:FAR:REFAREA.
    
    return totalWingArea.
}


function calculateLift {
	parameter alti is ALTITUDE.
    local craftName is SHIP.
    local totalLift is 0.
    local airDensity is airDensity(alti).

	// Calculate lift using lift equation: Lift = 0.5 * airDensity * velocity^2 * wingArea * liftCoefficient
	local velocity is craftName:VELOCITY:SURFACEMAGNITUDE.
	local liftCoefficient is ADDONS:FAR:CL.
	local totalLift is 0.5 * airDensity * velocity^2 * wingArea * liftCoefficient.
    
    return totalLift.
}

//calculate current vessel weight
function calculateWeight {
	parameter alti is ALTITUDE.
	parameter celestialBody is SHIP:BODY.
	parameter craft is SHIP.
	
	local craftMass is craft:MASS*1000.

	local gravity is (celestialBody:MU / ((celestialBody:RADIUS+alti)^2)).
	local weight is craftMass * gravity.

	return weight.
}

function liftoffSpeed {
	//parameter aoa is 10.
    parameter craftName is SHIP.
	
	local alti is ALTITUDE.
	local lift is calculateWeight(0).
	local airDensity is airDensity(alti).
	local wingArea is calculateWingArea().
	local liftCoefficient is 0.4.
	
	local minSpd is (2*lift/(airDensity*wingArea*liftCoefficient))^0.5.
	
	return minSpd.
}
