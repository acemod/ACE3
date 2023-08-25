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
 * [player, cursorObject] call ace_medical_treatment_fnc_placeInBodyBag
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_1("placeInBodyBag",_patient);

if ((alive _patient) && {!GVAR(allowBodyBagUnconscious)}) exitWith {
    [_medic, "ACE_bodyBag"] call EFUNC(common,addToInventory); // re-add slighly used bodybag?
    [LSTRING(bodybagWhileStillAlive)] call EFUNC(common,displayTextStructured);
};

// Body bag needs to be a little higher to prevent it from flipping
[_this, "ACE_bodyBagObject", [0, 0, 0.2]] call FUNC(placeInBodyBagOrGrave);
