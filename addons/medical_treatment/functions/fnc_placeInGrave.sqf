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

if ((alive _patient) && {!GVAR(allowGraveUnconscious)}) exitWith {
    [LSTRING(bodybagWhileStillAlive)] call EFUNC(common,displayTextStructured);
};

[_this, "Land_Grave_dirt_F"] call FUNC(placeInBodyBagOrGrave);
