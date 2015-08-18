/*
 * Author: GitHawk
 * Refuels the vehicle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 * 2: The nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_sink", "_rate", "_maxFuel"];
params ["_unit", "_target", "_nozzle"];

_sink = _nozzle getVariable [QGVAR(sink), objNull];
if (isNull _sink) exitWith {};

_rate =  getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(flowRate)) * GVAR(rate);
_maxFuel = getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(fuelCapacity));

[{
    private ["_source", "_sink", "_fuelInSource", "_fuelInSink", "_finished", "_fueling"];
    params ["_args", "_pfID"];
    _args params ["_unit", "_nozzle", "_rate", "_startFuel", "_maxFuel"];

    _fueling = _nozzle getVariable [QGVAR(isRefueling), false];

    _source = _nozzle getVariable [QGVAR(source), objNull];
    _sink = _nozzle getVariable [QGVAR(sink), objNull];
    if (isNull _source ||
            {isNull _sink} ||
            {(_sink distance (_source modelToWorld (_nozzle getVariable [QGVAR(attachPos), [0,0,0]]))) > 10} ||
            {!alive _source} ||
            {!alive _sink}) exitWith {
        [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);
        detach _nozzle;
        _nozzle setPosATL [(getPosATL _nozzle) select 0,(getPosATL _nozzle) select 1, 0];
        _nozzle setVelocity [0, 0, 0];
        _nozzle setVariable [QGVAR(isConnected), false, true];
        _nozzle setVariable [QGVAR(isRefueling), false, true];
        _nozzle setVariable [QGVAR(sink), objNull, true];
        _sink setVariable [QGVAR(nozzle), objNull, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    _fuelInSource = [_source] call FUNC(getFuel);
    if (_fuelInSource == 0) exitWith {
        [LSTRING(Hint_SourceEmpty), 2, _unit] call EFUNC(common,displayTextStructured);
        _nozzle setVariable [QGVAR(isRefueling), false, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    _finished = false;
    if !(_fuelInSource == INFINITE_FUEL) then {
        _fuelInSource = _fuelInSource - _rate;
    };
    if (_fuelInSource < 0 && {_fuelInSource > -1}) then {
        _fuelInSource = 0;
        _finished = true;
        [LSTRING(Hint_Empty), 2, _unit] call EFUNC(common,displayTextStructured);
    };

    _fuelInSink = fuel _sink  + ( _rate / _maxFuel);
    if (_fuelInSink > 1) then {
        _fuelInSink = 1;
        _finished = true;
        [LSTRING(Hint_Completed), 2, _unit] call EFUNC(common,displayTextStructured);
    };
    if !(local _sink) then {
        [[_sink, _fuelInSink], QUOTE({(_this select 0) setFuel (_this select 1)}), _sink] call EFUNC(common,execRemoteFnc);
    } else {
        _sink setFuel _fuelInSink;
    };
    [_unit, _source, _fuelInSource] call FUNC(setFuel);

    if (_finished || {!_fueling}) exitWith {
        if !(_fueling) then {
            [LSTRING(Hint_Stopped), 2, _unit] call EFUNC(common,displayTextStructured);
        };
        _nozzle setVariable [QGVAR(isRefueling), false, true];
    };

    // display flickers even at 1 second intervals
    //["displayTextStructured", [_unit], [[localize LSTRING(Hint_FuelProgress), round((_fuelInSink - _startFuel) * _maxFuel)], 2, _unit]] call EFUNC(common,targetEvent);
    //[[LSTRING(Hint_FuelProgress), round((_fuelInSink - _startFuel) * _maxFuel)], 2, _unit] call EFUNC(common,displayTextStructured);
}, 1, [_unit, _nozzle, _rate, fuel _target, _maxFuel]] call cba_fnc_addPerFrameHandler;
