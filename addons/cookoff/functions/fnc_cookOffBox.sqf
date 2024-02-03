#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, kymckay, johnb43
 * Start a cook-off in the given ammo box.
 *
 * Arguments:
 * 0: Ammo box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_cookOffBox
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_box", "_killer", "_instigator"];

if (_box getVariable [QGVAR(isCookingOff), false]) exitWith {};

_box setVariable [QGVAR(isCookingOff), true, true];

// Spawn cook-off effects on all connected machines
private _jipID = [QGVAR(cookOffBoxLocal), [
    _box,
    _killer,
    _instigator,
    CBA_missionTime,
    random [IGNITE_TIME / 2, IGNITE_TIME, IGNITE_TIME / 2 * 3], // generate random timers that are global
    random [SMOKE_TIME / 2, SMOKE_TIME, SMOKE_TIME / 2 * 3]
]] call CBA_fnc_globalEventJIP;

[_jipID, _box] call CBA_fnc_removeGlobalEventJIP;

_box setVariable [QGVAR(jipID), _jipID];
