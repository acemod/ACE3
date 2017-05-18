/*
 * Author: Grey
 * Loads Magazine into static weapon using a timer
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: unit <OBJECT>
 * 2: time to load <NUMBER>
 * 3: magazineClassOptional <OPTIONAL><STRING>
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

//Move player into animation if player is standing
if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary", 1] call EFUNC(common,doAnimation);
};

[_timeToLoad, [_static,_unit,_magazineClassOptional], {(_this select 0) call FUNC(loadMagazine)}, {}, localize LSTRING(loadingMortar)] call EFUNC(common,progressBar);
