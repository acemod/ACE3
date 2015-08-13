/*
 * Author: GitHawk
 * Refuels the vehicle
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: The rate <NUMBER>
 *
 * Return Value:
 * NIL
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_sink"];
params ["_unit", "_target", "_nozzle", "_rate", "_maxFuel"];

_sink = _nozzle getVariable [QGVAR(sink), objNull];
if (isNull _sink) exitWith {};

if !(local _sink) exitWith {
    [_this, QUOTE(DFUNC(refuel)), _target] call EFUNC(common,execRemoteFnc);
};

[{ 
    private ["_source", "_sink", "_fuelInSource", "_fuelInSink", "_finished", "_fueling"];
    params ["_args", "_pfID"];
    EXPLODE_5_PVT(_args,_unit,_nozzle,_rate,_startFuel,_maxFuel);
    
    _fueling = _nozzle getVariable [QGVAR(fueling), 0];
    _rate = _rate * 0.1;
    
    _source = _nozzle getVariable [QGVAR(source), objNull];
    _sink = _nozzle getVariable [QGVAR(sink), objNull];
    if (isNull _source || {isNull _sink} || {(_source distance _sink) > 20}) exitWith {
        detach _nozzle;
        _nozzle setPosATL [(getPosATL _nozzle) select 0,(getPosATL _nozzle) select 1, 0];
        _nozzle setVariable [QGVAR(sink), objNull];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    _fuelInSource = [_unit, _source] call FUNC(getFuel);
    if (_fuelInSource == 0) exitWith {
        _nozzle setVariable [QGVAR(fueling), 0, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    _finished = false;
    _fuelInSource = _fuelInSource - _rate;
    if (_fuelInSource < 0 && {_fuelInSource > -1}) then {
        _fuelInSource = 0;
        _finished = true;
    };
    
    _fuelInSink = fuel _sink  + ( _rate / _maxFuel);
    if (_fuelInSink > 1) then {
        _fuelInSink = 1;
        _finished = true;
    };
    _sink setFuel _fuelInSink;
    [_unit, _source, _fuelInSource] call FUNC(setFuel);
    
    if (_finished || {_fueling == 0}) exitWith {
        _nozzle setVariable [QGVAR(fueling), 0, true];
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
    
    // TODO display ace hint how many liters were transfered
}, 0.1, [_unit, _nozzle, _rate, fuel _target, _maxFuel]] call cba_fnc_addPerFrameHandler;
