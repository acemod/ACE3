#include "..\script_component.hpp"
/*
 * Author: Glowbal, drofseh
 * Places a dead body inside a body bag.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part (unused) <STRING>
 * 3: Treatment (unused) <STRING>
 * 4: Item user (unused) <OBJECT>
 * 5: Body bag classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_placeInBodyBag
 *
 * Public: No
 */

params ["_medic", "_patient", "", "", "", "_item"];
TRACE_1("placeInBodyBag",_patient);

if ((alive _patient) && {!GVAR(allowBodyBagUnconscious)}) exitWith {
    [_medic, _item] call EFUNC(common,addToInventory); // re-add slighly used bodybag?
    [LSTRING(bodybagWhileStillAlive)] call EFUNC(common,displayTextStructured);
};

// Body bag needs to be a little higher to prevent it from flipping
private _bodyBagClass = getText (configFile >> "CfgWeapons" >> _item >> QGVAR(bodyBagObject));
[_this, _bodyBagClass, [0, 0, 0.2], 0, false] call FUNC(placeInBodyBagOrGrave);
