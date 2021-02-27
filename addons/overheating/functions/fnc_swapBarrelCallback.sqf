#include "script_component.hpp"
/*
 * Author: Commy2, esteldunedain
 * Swap barrel callback
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
 * [player, currentWeapon player] call ace_overheating_fnc_swapBarrelCallback
 *
 * Public: No
 */

params ["_assistant", "_gunner", "_weapon"];
TRACE_3("params",_assistant,_gunner,_weapon);

if (_assistant isEqualTo _gunner) then {
    // Barrel mount gesture
    [_gunner, QGVAR(GestureMountMuzzle)] call EFUNC(common,doGesture);
    playSound "ACE_BarrelSwap";
};

if (GVAR(unJamOnSwapBarrel) && {[_gunner] call FUNC(canUnjam)}) then {
    [_gunner, currentMuzzle _gunner, true] call FUNC(clearJam);
};

// don't consume the barrel, but rotate through them.
[localize LSTRING(SwappedBarrel), QPATHTOF(UI\spare_barrel_ca.paa)] call EFUNC(common,displayTextPicture);

private _temp = _gunner getVariable [format [QGVAR(%1_temp), _weapon], 0];
private _barrelMass = _weapon call FUNC(getBarrelMass);

// Instruct the server to load the coolest spare barrel into the weapon and
// store the removed barrel with the former weapon temperature. The server
// also updates the current weapon temperature to match that of the new
// loaded barrel.
[QGVAR(loadCoolestSpareBarrel), [_assistant, _gunner, _weapon, _temp, _barrelMass]] call CBA_fnc_serverEvent;

// Store the update time
_gunner setVariable [format [QGVAR(%1_time), _weapon], CBA_missionTime];
