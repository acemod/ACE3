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

params ["_bodybag", "_medic"];
TRACE_2("placeBodyBagInGrave",_bodybag,_medic);

[
    GVAR(treatmentTimeGrave),
    _this,
    {
        TRACE_1("finished",_this);
        (_this#0) params ["_bodybag","_medic"];
        private _graveClassname = "";
        if (GVAR(graveDiggingMarker)) then {
            _graveClassname = missionNamespace getVariable [QGVAR(graveClassname), "ACE_Grave"];
        };
        private _graveRotation = missionNameSpace getVariable [QGVAR(graveRotation), 0]; 

        [[_medic, _bodybag], _graveClassname, [0,0,0], _graveRotation, true] call FUNC(placeInBodyBagOrGrave);
    },
    {TRACE_1("failed",_this);},
    LLSTRING(DiggingGrave)
    // ToDo: check FUNC(canDigGrave)? - what if body dragged/burried by someone else
] call EFUNC(common,progressBar);
