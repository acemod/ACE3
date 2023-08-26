#include "script_component.hpp"
/*
 * Author: Glowbal, drofseh
 * Places a dead body inside a body bag.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_placeInGrave
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_1("placeInGrave",_patient);

if ((alive _patient) && {GVAR(allowGraveDigging) < 2}) exitWith {
    [LSTRING(bodybagWhileStillAlive)] call EFUNC(common,displayTextStructured);
};

private _graveClassname = missionNameSpace getVariable [QGVAR(graveClassname), "Land_Grave_dirt_F"];
// Land_Grave_dirt_F needs to be rotated 90 degrees to line up with the body
private _graveRotation = missionNameSpace getVariable [QGVAR(graveRotation), 90]; 

[_this, _graveClassname, [0,0,0], _graveRotation] call FUNC(placeInBodyBagOrGrave);

