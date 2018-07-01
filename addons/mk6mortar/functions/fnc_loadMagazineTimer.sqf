/*
 * Author: Grey
 * Loads Magazine into static weapon using a timer.
 *
 * Arguments:
 * 0: Static <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Time to load <NUMBER>
 * 3: Magazine Class <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target,_player,"ACE_1Rnd_82mm_Mo_HE"] call ace_mk6mortar_fnc_loadMagazineTimer
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_static","_unit","_timeToLoad",["_magazineClassOptional","",[""]]];

_static setVariable [QGVAR(inUse), true, true];

// Move player into animation if player is standing
if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary", 1] call EFUNC(common,doAnimation);
};

[_timeToLoad, [_static,_unit,_magazineClassOptional], {(_this select 0) call FUNC(loadMagazine); ((_this select 0) select 0) setVariable [QGVAR(inUse), nil, true]}, {((_this select 0) select 0) setVariable [QGVAR(inUse), nil, true]}, localize LSTRING(loadingMortar)] call EFUNC(common,progressBar);
