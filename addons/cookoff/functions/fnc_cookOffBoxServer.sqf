#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, kymckay, johnb43
 * Start an ammo cook-off in the given ammo box.
 *
 * Arguments:
 * 0: Ammo box <OBJECT>
 * 1: Source <OBJECT> (default: objNull)
 * 2: Instigator <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_cookOffBoxServer
 *
 * Public: No
 */

if (!isServer) exitWith {};
if (!GVAR(enableAmmobox) || {GVAR(ammoCookoffDuration) == 0}) exitWith {};

params ["_box", ["_source", objNull], ["_instigator", objNull]];

// Make sure it's a box (important, because deleted EH is assigned to ReammoBox_F only in postInit)
if !(_box isKindOf "ReammoBox_F") exitWith {};

if !(_box getVariable [QGVAR(enableAmmoCookoff), true]) exitWith {};

// Allow only 1 cook-off per box at a time
if (_box getVariable [QGVAR(isCookingOff), false]) exitWith {};

_box setVariable [QGVAR(isCookingOff), true, true];

private _delay = random [SMOKE_DELAY / 2, SMOKE_DELAY, SMOKE_DELAY / 2 * 3];

// Spawn cook-off effects on all connected machines and JIP
private _jipID = [QGVAR(cookOffBoxLocal), [
    _box,
    _source,
    _instigator,
    CBA_missionTime + _delay // Generate a globally synced timestamp
]] call CBA_fnc_globalEventJIP;

[_jipID, _box] call CBA_fnc_removeGlobalEventJIP;

_box setVariable [QGVAR(cookoffBoxJipID), _jipID];

// API
[QGVAR(cookOffBox), [_box, _source, _instigator, _delay]] call CBA_fnc_globalEvent;
