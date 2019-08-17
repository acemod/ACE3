#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support and esteldunedain
 * Removes trench
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 * 2: SwitchingDigger <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_removeTrench
 *
 * Public: No
 */

params ["_trench", "_unit", ["_switchingDigger", false, [true]]];
TRACE_2("removeTrench", _trench, _unit, _switchingDigger);

private _actualProgress = _trench getVariable [QGVAR(progress), 0];
if (_actualProgress <= 0) exitWith {};

// Mark trench as being worked on
_trench setVariable [QGVAR(digging), true, true];
_trench setVariable [QGVAR(diggingType), "DOWN", true];
private _diggerCount = count (_trench getVariable [QGVAR(diggingPlayers), []]);

if (_diggerCount > 0) then {
    if !(_switchingDigger) then {
        [_trench, _unit] call FUNC(addDigger);
    };
} else {
    _trench setVariable [QGVAR(diggingPlayers), [ACE_player], true];
};

private _removeTime = missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> (typeOf _trench) >> QGVAR(removalDuration)), 20];
private _placeData = _trench getVariable [QGVAR(placeData), [[], []]];
_placeData params ["", "_vecDirAndUp"];

if (isNil "_vecDirAndUp") then {
    _vecDirAndUp = [vectorDir _trench, vectorUp _trench];
};

[QGVAR(handleDiggingServer), [_trench, _unit, true, true]] call CBA_fnc_serverEvent;

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];
    _trench setVariable [QGVAR(digging), false, true];
    _trench setVariable [QGVAR(diggingType), nil, true];
    [QGVAR(handleDiggingServer), [_trench, _unit, false, true]] call CBA_fnc_serverEvent;

    // Remove trench
    deleteVehicle _trench;

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit", "_trench"];
    _trench setVariable [QGVAR(digging), false, true];
    _trench setVariable [QGVAR(diggingType), nil, true];

    // Save progress global
    private _progress = _trench getVariable [QGVAR(progress), 0];
    _trench setVariable [QGVAR(progress), _progress, true];
    [QGVAR(handleDiggingServer), [_trench, _unit, false, true]] call CBA_fnc_serverEvent;

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_condition = {
    (_this select 0) params ["", "_trench"];

    if !(_trench getVariable [QGVAR(digging), false]) exitWith {false};
    if (count (_trench getVariable [QGVAR(diggingPlayers),[]]) <= 0) exitWith {false};
    if (GVAR(stopBuildingAtFatigueMax) && {EGVAR(advanced_fatigue,anReserve) <= 0})  exitWith {false};
    true
};
[_removeTime, [_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize LSTRING(RemovingTrench), _fnc_condition, [], ((_trench getVariable [QGVAR(progress), 1]) <= 0)] call EFUNC(common,progressBar);

[{
    params ["_args", "_handle"];
    _args params ["_trench", "_unit", "_removeTime", "_vecDirAndUp"];
    private _actualProgress = _trench getVariable [QGVAR(progress), 0];
    private _diggerCount = count (_trench getVariable [QGVAR(diggingPlayers), []]);

    if (_actualProgress <= 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        _trench setVariable [QGVAR(digging), false, true];
        _trench setVariable [QGVAR(diggingPlayers), [], true];
        deleteVehicle _trench;
    };

    if (
        !(_trench getVariable [QGVAR(digging), false]) ||
        {_diggerCount <= 0}
    ) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        _trench setVariable [QGVAR(digging), false, true];
        _trench setVariable [QGVAR(diggingPlayers), _trench getVariable [QGVAR(diggingPlayers), []] - [_unit], true];
    };

    private _pos = getPosWorld _trench;
    private _posDiff = (_trench getVariable [QGVAR(diggingSteps), 0]) * _diggerCount;
    _pos set [2,((_pos select 2) - _posDiff)];

    _trench setPosWorld _pos;
    _trench setVectorDirAndUp _vecDirAndUp;

    //Fatigue impact
    EGVAR(advanced_fatigue,anReserve) = (EGVAR(advanced_fatigue,anReserve) - ((_removeTime /12) * GVAR(buildFatigueFactor))) max 0;
    EGVAR(advanced_fatigue,anFatigue) = (EGVAR(advanced_fatigue,anFatigue) + (((_removeTime /12) * GVAR(buildFatigueFactor))/1200)) min 1;

    if (GVAR(stopBuildingAtFatigueMax) && {EGVAR(advanced_fatigue,anReserve) <= 0}) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        _trench setVariable [QGVAR(digging), false, true];
        _trench setVariable [QGVAR(diggingPlayers), _trench getVariable [QGVAR(diggingPlayers), []] - [_unit], true];
    };
},1,[_trench, _unit, _removeTime, _vecDirAndUp]] call CBA_fnc_addPerFrameHandler;

// Play animation
[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
