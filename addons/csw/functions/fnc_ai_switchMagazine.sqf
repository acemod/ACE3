#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Handles AI magazine switching
 * Magazine must be compatible and available, use ace_csw_fnc_getAvailableAmmo
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Carry Magazine <STRING>
 * 2: Turret Path <ARRAY> (default: [0])
 * 3: Skip reload time <BOOL> (default: false)
 * 4: Clear forced magazine after reloading <BOOL> (default: true)
 *
 * Return Value:
 * Successful <BOOL>
 *
 * Example:
 * [cursorTarget, "ACE_csw_100Rnd_127x99_mag_red", [0]] call ace_csw_fnc_ai_switchMagazine
 *
 * Public: Yes
 */
params [["_vehicle", objNull, [objNull]], ["_carryMag", "", [""]], ["_turretPath", [0], [[0]]], ["_instantReload", false, [false]], ["_clearForcedMag", true, [true]]];

if !(alive _vehicle && {!isNull (_vehicle turretUnit _turretPath)} && {!(isNull _vehicle)}) exitWith {false};

// must be config case
_carryMag = configName (configFile >> "CfgMagazines" >> _carryMag);
if (_carryMag isEqualTo "") exitWith {false};

private _availableMags = [_vehicle] call FUNC(getAvailableAmmo);
if !(_carryMag in _availableMags) exitWith {false};

_vehicle setVariable [QGVAR(forcedMag), _carryMag, true];

private _gunner = _vehicle turretUnit _turretPath;

[QGVAR(ai_reload), [_vehicle, _gunner, _instantReload, _clearForcedMag], _gunner] call CBA_fnc_targetEvent;

true
