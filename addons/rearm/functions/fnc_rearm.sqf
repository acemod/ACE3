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

params ["_target", "_unit"];
TRACE_2("rearm",_target,_unit);

private _attachedDummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _attachedDummy) exitwith {ERROR_1("attachedDummy null",_attachedDummy);};
private _magazineClass = _attachedDummy getVariable QGVAR(magazineClass);
if (isNil "_magazineClass") exitWith {ERROR_1("magazineClass nil",_attachedDummy);};

([_magazineClass] call FUNC(getCaliber)) params ["_cal", "_idx"];

// Get magazines that can be rearmed
private _needRearmMags = [_target] call FUNC(getNeedRearmMagazines);
private _needRearmMagsOfClass = _needRearmMags select {(_x select 0) isEqualTo _magazineClass};

// Exit if no magazines need rearming
if ((count _needRearmMagsOfClass) == 0) exitWith {ERROR_2("Could not find turret for %1 in %2",_magazineClass,typeOf _target);};

private _currentRearmableMag = _needRearmMagsOfClass select 0;
_currentRearmableMag params ["", "_turretPath", "", "_pylon", "", "_magazineCount"];

private _magazineDisplayName =  getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName");
if (_magazineDisplayName == "") then {
    _magazineDisplayName = _magazineClass;
    ERROR_1("Magazine is missing display name [%1]",_magazineClass);
};

[
    TIME_PROGRESSBAR(REARM_DURATION_REARM select _idx),
    [_target, _unit, _turretPath, _magazineCount, _magazineClass, (REARM_COUNT select _idx), _pylon],
    {(_this select 0) call FUNC(rearmSuccess)},
    "",
    format [localize LSTRING(RearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"), _magazineDisplayName],
    {
        param [0] params ["_target", "_unit"];
        (_unit distanceSqr _target) <= REARM_ACTION_DISTANCE_SQR
    },
    ["isnotinside"]
] call EFUNC(common,progressBar);
