/*
 * Author: Commy2
 * Make a unit start swapping it's barrel
 *
 * Arguments:
 * 0: Unit initiating the action <OBJECT>
 * 1: Unit that has the weapon <OBJECT>
 * 2: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, player, currentWeapon player] call ace_overheating_fnc_swapBarrel
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_assistant", "_gunner", "_weapon"];
TRACE_3("params",_assistant,_gunner,_weapon);

// Make the standing player kneel down
if (stance _gunner != "PRONE") then {
    [_gunner, "amovpknlmstpsraswrfldnon", 1] call EFUNC(common,doAnimation);
};

// Barrel dismount gesture
[_gunner, QGVAR(GestureDismountMuzzle)] call EFUNC(common,doGesture);
playSound "ACE_BarrelSwap";

private _duration = 3.0;
if (_assistant isEqualTo _gunner) then {
    _duration = 5.0;
};

[_duration, [_assistant,_gunner,_weapon], {(_this select 0) call FUNC(swapBarrelCallback)}, {}, localize LSTRING(SwappingBarrel), nil, ["isNotInside", "isNotSitting", "isNotSwimming"]] call EFUNC(common,progressBar);
