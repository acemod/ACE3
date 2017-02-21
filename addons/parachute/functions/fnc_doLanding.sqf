/*
 * Author: Garth 'L-H' de Wet
 * Performs the landing animation fix
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACE_Parachute_fnc_doLanding;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

GVAR(PFH) = false;

[_unit, "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", 2] call EFUNC(common,doAnimation);

_unit setVariable [QGVAR(chuteIsCut), false, true];

[{
    (_this select 0) params ["_time", "_unit"];

    if (CBA_missionTime > _time + 1) then {
        [_unit, "Crouch"] call EFUNC(common,doGesture);
        [_this select 1] call CALLSTACK(CBA_fnc_removePerFrameHandler);
    };
}, 1, [CBA_missionTime, _unit]] call CALLSTACK(CBA_fnc_addPerFrameHandler);
