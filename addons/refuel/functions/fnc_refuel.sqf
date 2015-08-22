/*
 * Author: GitHawk
 * Refuels the vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Nozzle <OBJECT>
 * 3: Connection Point <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

#define PFH_STEPSIZE 0.1

private ["_rate", "_maxFuel"];
params ["_unit", "_target", "_nozzle", "_connectToPoint"];

_rate =  getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(flowRate)) * GVAR(rate) * PFH_STEPSIZE;
_maxFuel = getNumber (configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(fuelCapacity));

[{
    private ["_source", "_tooFar", "_fuelInSource", "_fuelInSink", "_finished", "_fueling"];
    params ["_args", "_pfID"];
    _args params ["_source", "_sink", "_unit", "_nozzle", "_rate", "_startFuel", "_maxFuel", "_connectFromPoint", "_connectToPoint"];

    _fueling = _nozzle getVariable [QGVAR(isRefueling), false];
    if (!alive _source || {!alive _sink}) exitWith {
        [objNull, _nozzle] call FUNC(dropNozzle);
        _nozzle setVariable [QGVAR(isConnected), false, true];
        _nozzle setVariable [QGVAR(sink), objNull, true];
        _sink setVariable [QGVAR(nozzle), objNull, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    _tooFar = ((_sink modelToWorld _connectToPoint) distance (_source modelToWorld _connectFromPoint)) > 10;
    if (_tooFar) exitWith {
        [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);

        [objNull, _nozzle] call FUNC(dropNozzle);
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

        _fuelInSink = (_unit getVariable [QGVAR(tempFuel), _startFuel])  + ( _rate / _maxFuel);
        if (_fuelInSink > 1) then {
            _fuelInSink = 1;
            _finished = true;
            [LSTRING(Hint_Completed), 2, _unit] call EFUNC(common,displayTextStructured);
        };
        _unit setVariable [QGVAR(tempFuel), _fuelInSink];

        if !(local _sink) then {
            [[_sink, _fuelInSink], "{(_this select 0) setFuel (_this select 1)}", _sink] call EFUNC(common,execRemoteFnc);
        } else {
            _sink setFuel _fuelInSink;
        };
        [_source, _fuelInSource] call FUNC(setFuel);
    } else {
        _unit setVariable [QGVAR(tempFuel), fuel _sink];
    };

    if (_finished) exitWith {
        _nozzle setVariable [QGVAR(isRefueling), false, true];
    };
},
PFH_STEPSIZE,
[_nozzle getVariable QGVAR(source),
    _target,
    _unit,
    _nozzle,
    _rate,
    fuel _target,
    _maxFuel,
    _nozzle getVariable [QGVAR(attachPos), [0,0,0]],
    _connectToPoint]
] call cba_fnc_addPerFrameHandler;
