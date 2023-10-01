#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Places a body bag inside a grave.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_medical_treatment_fnc_placeBodyBagInGrave
 *
 * Public: No
 */

params ["_bodybag"];
TRACE_1("placeBodyBagInGrave",_bodybag);

[
    QGVAR(treatmentTimeGrave),
    _this,
    {
        [[_this#1, _this#0], missionNameSpace getVariable [QGVAR(graveClassname), "ACE_Grave"], [0,0,0], missionNameSpace getVariable [QGVAR(graveRotation), 0]] call FUNC(placeInBodyBagOrGrave);
    },
    {},
    LLSTRING(DiggingGrave)
] call EFUNC(common,progressBar);
