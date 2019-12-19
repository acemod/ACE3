#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the inclination angle input fields
 *
 * Arguments:
 * Reference input field ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 0 call ace_atragmx_fnc_update_inclination_angle
 *
 * Public: No
 */

private _inclinationAngleCosine = 0.5 max parseNumber(ctrlText 140041) min 1;
private _inclinationAngleDegree = -60 max parseNumber(ctrlText 140040) min 60;

if (_this == 0) then {
    ctrlSetText [140040, Str(round(acos(_inclinationAngleCosine)))];
} else {
    ctrlSetText [140041, Str(round(cos(_inclinationAngleDegree) * 100) / 100)];
};
