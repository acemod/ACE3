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
    private ["_source", "_sink", "_tooFar", "_fuelInSource", "_fuelInSink", "_finished", "_fueling"];
    params ["_args", "_pfID"];
    _args params ["_unit", "_nozzle", "_rate", "_startFuel", "_maxFuel"];

    _fueling = _nozzle getVariable [QGVAR(isRefueling), false];

    _source = _nozzle getVariable [QGVAR(source), objNull];
    _sink = _nozzle getVariable [QGVAR(sink), objNull];
    if (isNull _source ||
            {!alive _source} ||
            {isNull _sink} ||
            {!alive _sink}) exitWith {
        REFUEL_DROP_NOZZLE(_nozzle)
        _nozzle setVariable [QGVAR(isConnected), false, true];
        _nozzle setVariable [QGVAR(sink), objNull, true];
        _sink setVariable [QGVAR(nozzle), objNull, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    _tooFar = (_sink distance (_source modelToWorld (_nozzle getVariable [QGVAR(attachPos), [0,0,0]]))) > 10;
    if (_tooFar) exitWith {
        [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);

        REFUEL_DROP_NOZZLE(_nozzle)
        _nozzle setVariable [QGVAR(isConnected), false, true];
        _nozzle setVariable [QGVAR(sink), objNull, true];
        _sink setVariable [QGVAR(nozzle), objNull, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };

    _finished = false;
    if (_fueling) then {
        _fuelInSource = [_source] call FUNC(getFuel);
        if (_fuelInSource == 0) exitWith {
            [LSTRING(Hint_SourceEmpty), 2, _unit] call EFUNC(common,displayTextStructured);
            _nozzle setVariable [QGVAR(isRefueling), false, true];
        };
        if !(_fuelInSource == REFUEL_INFINITE_FUEL) then {
            _fuelInSource = _fuelInSource - _rate;
        };
        if (_fuelInSource < 0 && {_fuelInSource > -1}) then {
            _fuelInSource = 0;
            _finished = true;
            [LSTRING(Hint_SourceEmpty), 2, _unit] call EFUNC(common,displayTextStructured);
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
    };

    if (_finished || {!_fueling}) exitWith {
        if !(_fueling) then {
            [LSTRING(Hint_Stopped), 2, _unit] call EFUNC(common,displayTextStructured);
        };
        _nozzle setVariable [QGVAR(isRefueling), false, true];
    };
}, 1, [_unit, _nozzle, _rate, fuel _target, _maxFuel]] call cba_fnc_addPerFrameHandler;
