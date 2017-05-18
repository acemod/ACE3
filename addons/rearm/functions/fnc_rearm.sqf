/*
 * Author: GitHawk
 * Starts progress bar for rearming a vehicle.
 *
 * Arguments:
 * 0: Target Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, player] call ace_rearm_fnc_rearm
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_target", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

private _attachedDummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _attachedDummy) exitwith {false};
private _magazineClass = _attachedDummy getVariable QGVAR(magazineClass);
if (isNil "_magazineClass") exitWith {false};

([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];

// Get magazines that can be rearmed
private _needRearmMags = [_target, _magazineClass] call FUNC(getNeedRearmMagazines);
_needRearmMags params ["_needRearm", "_turretPath", "_cnt"];

// Exit if no magazines need rearming
if (!_needRearm) exitWith {
    diag_log format ["[ACE] ERROR: Could not find turret for %1 in %2", _magazineClass, typeOf _target];
};

private _magazineDisplayName =  getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName");
if (_magazineDisplayName == "") then {
    _magazineDisplayName = _magazineClass;
    diag_log format ["[ACE] ERROR: Magazine is missing display name [%1]", _magazineClass];
};

[
    (REARM_DURATION_REARM select _idx),
    [_target, _unit, _turretPath, _cnt, _magazineClass, (REARM_COUNT select _idx)],
    FUNC(rearmSuccess),
    "",
    format [localize LSTRING(RearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"), _magazineDisplayName],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
