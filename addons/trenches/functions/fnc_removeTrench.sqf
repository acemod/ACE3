#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support and esteldunedain
 * Removes trench
 *
 * Arguments:
 * 0: trench <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_removeTrench
 *
 * Public: No
 */

params ["_trench", "_unit"];
TRACE_2("removeTrench",_trench,_unit);

private _actualProgress = _trench getVariable [QGVAR(progress), 0];
if(_actualProgress == 0) exitWith {};

// Mark trench as being worked on
_trench setVariable [QGVAR(digging), true, true];

private _removeTime = getNumber (configFile >> "CfgVehicles" >> (typeof _trench) >> QGVAR(removalDuration));
private _removeTimeLeft = _removeTime * _actualProgress;

private _placeData = _trench getVariable [QGVAR(placeData), [[], []]];
_placeData params ["_basePos", "_vecDirAndUp"];

private _trenchId = _unit getVariable [QGVAR(isDiggingId), -1];
if(_trenchId < 0) then {
    _trenchId = GVAR(trenchId);
    _unit setVariable [QGVAR(isDiggingId), _trenchId, true];
    GVAR(trenchId) = GVAR(trenchId) + 1;
};

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];
    _unit setVariable [QGVAR(isDiggingId), -1, true];

    // Remove trench
    deleteVehicle _trench;

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit", "_trench"];
    _unit setVariable [QGVAR(isDiggingId), -1, true];
    _trench setVariable [QGVAR(digging), false, true];

    // Save progress global
    private _progress = _trench getVariable [QGVAR(progress), 0];
    _trench setVariable [QGVAR(progress), _progress, true];

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_condition = {
    (_this select 0) params ["_unit"];
    "ACE_EntrenchingTool" in (_unit call EFUNC(common,uniqueItems))
};
[(_removeTimeLeft + 0.5), [_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize LSTRING(RemovingTrench), _fnc_condition] call EFUNC(common,progressBar);

private _progressLeft = ((1 - _actualProgress) * 10) + 1;

for "_i" from _progressLeft to 10 do {
    private _vectorDiffZ = _i / 10;
    private _delay = _removeTime * ((_i / 10) - (1 - _actualProgress));
    private _progress = 1 - (_i / 10);

    [DFUNC(setTrenchPlacement), [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, _vectorDiffZ], _vecDirAndUp, _progress], _delay] call CBA_fnc_waitAndExecute;
};

// Play animation
[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
