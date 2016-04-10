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
#include "script_component.hpp"

params ["_static","_unit","_timeToUnload"];

//Move player into animation if player is standing
if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary", 1] call EFUNC(common,doAnimation);
};

[_timeToUnload, [_static,_unit], {(_this select 0) call FUNC(unloadMagazine)}, {}, localize LSTRING(unloadingMortar)] call EFUNC(common,progressBar);
