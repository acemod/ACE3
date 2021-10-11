#include "script_component.hpp"
/*
 * Author: GitHawk
 * Refuels the vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Nozzle <OBJECT>
 * 3: Connection Point <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, nozzle, [2, 1, 5]] call ace_refuel_fnc_refuel
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_sink", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_connectToPoint", [0,0,0], [[]], 3]];

private _config = configOf _sink;

private _rate =  getNumber (_config >> QGVAR(flowRate)) * GVAR(rate);
private _maxFuel = getNumber (_config >> QGVAR(fuelCapacity));

// Fall back to vanilla fuelCapacity value (only air and sea vehicles don't have this defined by default by us)
// Air and sea vehicles have that value properly defined in liters, unlike ground vehicles which is is formula of (range * tested factor) - different fuel consumption system than ground vehicles
if (_maxFuel == 0) then {
    _maxFuel = getNumber (_config >> "fuelCapacity");
};

[{
    params ["_args", "_pfID"];
    _args params [["_source", objNull, [objNull]], ["_sink", objNull, [objNull]], ["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_rate", 1, [0]], ["_startFuel", 0, [0]], ["_maxFuel", 0, [0]], ["_connectFromPoint", [0,0,0], [[]], 3], ["_connectToPoint", [0,0,0], [[]], 3]];

    if !(_nozzle getVariable [QGVAR(isConnected), false]) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    if (!alive _source || {!alive _sink}) exitWith {
        [objNull, _nozzle] call FUNC(dropNozzle);
        _nozzle setVariable [QGVAR(isConnected), false, true];
        if (_nozzle isKindOf "Land_CanisterFuel_F") then { _nozzle setVariable [QEGVAR(cargo,canLoad), true, true]; };
        _nozzle setVariable [QGVAR(sink), nil, true];
        _sink setVariable [QGVAR(nozzle), nil, true];
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    private _hoseLength = _source getVariable [QGVAR(hoseLength), GVAR(hoseLength)];
    private _tooFar = ((_sink modelToWorld _connectToPoint) distance (_source modelToWorld _connectFromPoint)) > (_hoseLength - 2);
    if (_tooFar && {!(_nozzle getVariable [QGVAR(jerryCan), false])}) exitWith {
        [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);

        [objNull, _nozzle] call FUNC(dropNozzle);
        _nozzle setVariable [QGVAR(isConnected), false, true];
        if (_nozzle isKindOf "Land_CanisterFuel_F") then { _nozzle setVariable [QEGVAR(cargo,canLoad), true, true]; };
        _nozzle setVariable [QGVAR(sink), nil, true];
        _sink setVariable [QGVAR(nozzle), nil, true];
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _finished = false;
    private _fueling = _nozzle getVariable [QGVAR(isRefueling), false];
    if (_fueling) then {
        private _fuelInSource = [_source] call FUNC(getFuel);
        if (_fuelInSource == 0) exitWith {
            [LSTRING(Hint_SourceEmpty), 2, _unit] call EFUNC(common,displayTextStructured);
            _nozzle setVariable [QGVAR(lastTickMissionTime), nil];
            _nozzle setVariable [QGVAR(isRefueling), false, true];
        };

        // Calculate rate using mission time to take time acceleration and pause into account
        private _rateTime = _rate * (CBA_missionTime - (_nozzle getVariable [QGVAR(lastTickMissionTime), CBA_missionTime]));
        _nozzle setVariable [QGVAR(lastTickMissionTime), CBA_missionTime];

        if (_fuelInSource != REFUEL_INFINITE_FUEL) then {
            if (_rateTime > _fuelInSource) then {
                _rateTime = _fuelInSource;
                _fuelInSource = 0;
            } else {
                _fuelInSource = _fuelInSource - _rateTime;
            };
        } else {
            _source setVariable [QGVAR(fuelCounter), (_source getVariable [QGVAR(fuelCounter), 0]) + _rateTime, true];
        };
        if (_fuelInSource <= 0 && {_fuelInSource != REFUEL_INFINITE_FUEL}) then {
            _fuelInSource = 0;
            [_source, _fuelInSource] call FUNC(setFuel);
            _finished = true;
            [LSTRING(Hint_SourceEmpty), 2, _unit] call EFUNC(common,displayTextStructured);
        };

        private _fuelInSink = (_unit getVariable [QGVAR(tempFuel), _startFuel])  + ( _rateTime / _maxFuel);
        if (_fuelInSink > 1) then {
            _fuelInSink = 1;
            _finished = true;
            [LSTRING(Hint_Completed), 2, _unit] call EFUNC(common,displayTextStructured);
        };
        _unit setVariable [QGVAR(tempFuel), _fuelInSink];

        [QGVAR(tick), [_source, _sink, _rateTime]] call CBA_fnc_localEvent;

        [QEGVAR(common,setFuel), [_sink, _fuelInSink], _sink] call CBA_fnc_targetEvent;
        [_source, _fuelInSource] call FUNC(setFuel);
    } else {
        _unit setVariable [QGVAR(tempFuel), fuel _sink];
    };

    if (_finished) exitWith {
        [QGVAR(stopped), [_source, _sink]] call CBA_fnc_localEvent;
        _nozzle setVariable [QGVAR(lastTickMissionTime), nil];
        _nozzle setVariable [QGVAR(isRefueling), false, true];
    };
}, 1, [
    _nozzle getVariable QGVAR(source),
    _sink,
    _unit,
    _nozzle,
    _rate,
    fuel _sink,
    _maxFuel,
    _nozzle getVariable [QGVAR(attachPos), [0,0,0]],
    _connectToPoint
]] call CBA_fnc_addPerFrameHandler;
