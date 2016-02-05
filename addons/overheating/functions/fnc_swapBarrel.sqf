/*
 * Author: Commy2
 * Make a unit start swapping it's barrel
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_swapBarrel
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_weapon"];
TRACE_2("params",_player,_weapon);

// Make the standing player kneel down
if (stance _player != "PRONE") then {
    [_player, "amovpknlmstpsraswrfldnon", 1] call EFUNC(common,doAnimation);
};

// Barrel dismount gesture
_player playActionNow QGVAR(GestureDismountMuzzle);
playSound "ACE_BarrelSwap";

[5, [_player, _weapon], {(_this select 0) call FUNC(swapBarrelCallback)}, {}, (localize LSTRING(SwappingBarrel))] call EFUNC(common,progressBar);
