#include "script_component.hpp"
/*
 * Author: Grey
 *
 * Unload current magazine from static weapon using a timer
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: unit <OBJECT>
 * 2: time to unload <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, _player, 5] call ace_mk6mortar_fnc_unloadMagazineTimer
 *
 * Public: Yes
 */

params ["_static","_unit","_timeToUnload"];

_static setVariable [QGVAR(inUse), true, true];

//Move player into animation if player is standing
if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary", 1] call EFUNC(common,doAnimation);
};

[_timeToUnload, [_static,_unit], {(_this select 0) call FUNC(unloadMagazine); ((_this select 0) select 0) setVariable [QGVAR(inUse), nil, true]}, {((_this select 0) select 0) setVariable [QGVAR(inUse), nil, true]}, localize LSTRING(unloadingMortar)] call EFUNC(common,progressBar);
