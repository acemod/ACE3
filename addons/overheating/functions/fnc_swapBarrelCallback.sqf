/*
 * Author: Commy2, esteldunedain
 * Swap barrel callback
 *
 * Argument:
 * 0: Unit initiating the action <OBJECT>
 * 1: Unit that has the weapon <OBJECT>
 * 2: Weapon <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_swapBarrelCallback
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_assistant", "_gunner", "_weapon"];
TRACE_3("params",_assistant,_gunner,_weapon);

if (_assistant isEqualTo _gunner) then {
    // Barrel mount gesture
    _gunner playAction QGVAR(GestureMountMuzzle);
    playSound "ACE_BarrelSwap";
};

// don't consume the barrel, but rotate through them.
[localize LSTRING(SwappedBarrel), QPATHTOF(UI\spare_barrel_ca.paa)] call EFUNC(common,displayTextPicture);

private _temp = _gunner getVariable [format [QGVAR(%1_temp), _weapon], 0];
private _barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

// Instruct the server to load the coolest spare barrel into the weapon and
// store the removed barrel with the former weapon temperature. The server
// also updates the current weapon temperature to match that of the new
// loaded barrel.
["spareBarrelsLoadCoolest", [_assistant, _gunner, _weapon, _temp, _barrelMass]] call EFUNC(common,serverEvent);

// Store the update time
_gunner setVariable [format [QGVAR(%1_time), _weapon], CBA_missionTime];
