#include "..\script_component.hpp"
/*
 * Author: GitHawk, QuantX
 * Refuels the vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Nozzle <OBJECT>
 * 2: Refuel container? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, _nozzle, false] call ace_refuel_fnc_refuel
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_sink", "_nozzle", "_refuelContainer"];

private _config = configOf _sink;
private _rate = if (isNumber (_config >> QGVAR(flowRate))) then {
    getNumber (_config >> QGVAR(flowRate)) * GVAR(rate)
} else {
    // Jerry cans for example have no flow rate defined, default to 1
    GVAR(rate)
};

// How much fuel is in a vehicle's fuel tank
private _maxFuelTank = getNumber (_config >> QGVAR(fuelCapacity));
// Fall back to vanilla fuelCapacity value (only air and sea vehicles don't have this defined by default by us)
// Air and sea vehicles have that value properly defined in liters, unlike ground vehicles where it is a formula of (range * tested factor) due to a different fuel consumption system
if (_maxFuelTank == 0) then {
    _maxFuelTank = getNumber (_config >> "fuelCapacity");
};

// Wipe refuel amount, so that nozzle doesn't carry over information from previous refuelling
_nozzle setVariable [QGVAR(tempFuel), nil];
_nozzle setVariable [QGVAR(lastTickMissionTime), nil];

[{
    params ["_args", "_pfhID"];
    _args params ["_source", "_sink", "_nozzle", "_rate", "_maxFuelTank", "_refuelContainer"];

    if !(_nozzle getVariable [QGVAR(isConnected), false]) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Quit if fuel tank was destroyed
    if (!alive _sink) exitWith {
        [objNull, _nozzle] call FUNC(disconnect);

        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Main fueling process
    private _finished = false;

    if (_nozzle getVariable [QGVAR(isRefueling), false]) then {
        // Use special cargo refuel rate when refueling containers
        // TODO: Add flow dedicated input/output flow rates for every container and use the lower of the two instead
        if (_refuelContainer) then {_rate = GVAR(cargoRate)};

        // Calculate rate using mission time to take time acceleration and pause into account
        private _addedFuel = _rate * (CBA_missionTime - (_nozzle getVariable [QGVAR(lastTickMissionTime), CBA_missionTime]));
        _nozzle setVariable [QGVAR(lastTickMissionTime), CBA_missionTime];

        // Figure out exactly how much fuel to transfer while being sure not to take too much from source
        private _fuelInSource = _source call FUNC(getFuel);
        private _unit = _nozzle getVariable [QGVAR(user), objNull];

        if ((_source call FUNC(getCapacity)) != REFUEL_INFINITE_FUEL) then {
            if (_addedFuel > _fuelInSource) then {
                _addedFuel = _fuelInSource;
                _fuelInSource = 0;
                _finished = true;

                [QEGVAR(common,displayTextStructured), [LSTRING(hint_SourceEmpty), 2, _unit], _unit] call CBA_fnc_targetEvent;
            } else {
                _fuelInSource = _fuelInSource - _addedFuel;
            };
        };

        private _fuelInSink = (if (_refuelContainer) then {
            _sink call FUNC(getFuel)
        } else {
            // How full the gas tank is. We keep our own record, since `fuel _sink` doesn't update quick enough
            (_nozzle getVariable [QGVAR(tempFuel), fuel _sink]) * _maxFuelTank
        }) + _addedFuel;

        // Add fuel to target while being sure not to put too much into sink
        private _maxFuelContainer = _sink call FUNC(getCapacity);

        private _maxFuel = [_maxFuelTank, _maxFuelContainer] select _refuelContainer;

        if (_fuelInSink >= _maxFuel) then {
            // Put any extra fuel back
            _fuelInSource = _fuelInSource + (_fuelInSink - _maxFuel);
            _addedFuel = _maxFuel - _fuelInSink;
            // We're done
            _fuelInSink = _maxFuel;
            _finished = true;

            [QEGVAR(common,displayTextStructured), [LSTRING(hint_Completed), 2, _unit], _unit] call CBA_fnc_targetEvent;
        };

        if (_refuelContainer) then {
            [_sink, _fuelInSink] call FUNC(setFuel);
        } else {
            private _fillRatio = _fuelInSink / _maxFuelTank;

            [QEGVAR(common,setFuel), [_sink, _fillRatio], _sink] call CBA_fnc_targetEvent;

            _nozzle setVariable [QGVAR(tempFuel), _fillRatio];
        };

        // Increment fuel counter
        _source setVariable [QGVAR(fuelCounter), (_source getVariable [QGVAR(fuelCounter), 0]) + _addedFuel, true];

        [QGVAR(tick), [_source, _sink, _addedFuel, _refuelContainer, _nozzle]] call CBA_fnc_localEvent;

        [_source, _fuelInSource] call FUNC(setFuel);
    } else {
        _nozzle setVariable [QGVAR(tempFuel), fuel _sink];
        _nozzle setVariable [QGVAR(lastTickMissionTime), nil];
    };

    // Reset variables when done
    if (!_finished) exitWith {};

    [QGVAR(stopped), [_source, _sink, _nozzle]] call CBA_fnc_localEvent;

    _nozzle setVariable [QGVAR(lastTickMissionTime), nil];
    _nozzle setVariable [QGVAR(isRefueling), false, true];

    // Only play start/stop sounds for nozzles
    if (_nozzle getVariable [QGVAR(jerryCan), false]) exitWith {};

    [_nozzle, QGVAR(nozzle_stop), nil, true, true, true] call CBA_fnc_globalSay3D;
}, 1, [
    _nozzle getVariable QGVAR(source),
    _sink,
    _nozzle,
    _rate,
    _maxFuelTank,
    _refuelContainer
]] call CBA_fnc_addPerFrameHandler;
