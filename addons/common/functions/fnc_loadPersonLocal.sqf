#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Load a person, local
 *
 * Arguments:
 * 0: unit to be loaded <OBJECT>
 * 1: vehicle that will beloaded <OBJECT>
 * 2: caller that will load <OBJECT>
 * 3: preferred seats <ARRAY>
 * 4: reverse fill <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, car, kevin] call ace_common_fnc_loadPersonLocal
 *
 * Public: Yes
 */

params ["_unit", "_vehicle", ["_caller", objNull], ["_preferredSeats", []], ["_reverseFill", false]];
TRACE_5("loadPersonLocal",_unit,_vehicle,_caller,_preferredSeats,_reverseFill);

private _slotsOpen = false;
if ((_vehicle emptyPositions "cargo" > 0) && {!(_unit getVariable ['ACE_isUnconscious', false]) || {(getNumber (configOf _vehicle >> "ejectDeadCargo")) == 0}}) then {
    if (_preferredSeats isNotEqualTo []) then {
        private _taken = [];
        {
            _taken pushBackUnique (_vehicle getCargoIndex _x);
        } forEach crew _vehicle;
        private _preferredSeats = _preferredSeats - _taken;
        if (count _preferredSeats > 0) then {
            _unit moveInCargo [_vehicle, _preferredSeats select 0];
            TRACE_2("moveInCargo",_vehicle,_preferredSeats select 0);
            _slotsOpen = true;
        };
    };
    if (!_slotsOpen) then {
        private _cargoSeats = fullCrew [_vehicle, "cargo", true];
        // FFV cargo seats are empty cargo positions but are not returned by fullCrew "cargo"
        if (_cargoSeats isEqualTo []) then {
            _cargoSeats = (fullCrew [_vehicle, "turret", true]) select {_x select 4};
        };
        if (_reverseFill) then {
            reverse _cargoSeats;
        };
        private _index = _cargoSeats findIf {isNull (_x select 0)};
        _unit moveInCargo [_vehicle, (_cargoSeats select _index) select 2];
        TRACE_2("moveInCargo",_vehicle,_index);
        _slotsOpen = true;
    };
} else {
    // Check if an empty turret is available
    // This already excludes FFV seats, which count as cargo positions
    private _turrets = fullCrew [_vehicle, "turret", true];
    private _index = _turrets findIf {isNull (_x#0)};
    if (_index >= 0) exitWith {
        _unit moveInTurret [_vehicle, _turrets#_index#3];
        TRACE_2("moveInTurret",_vehicle,_turrets#_index#3);
        _slotsOpen = true;
    };

    // Check if the commander seat is available
    if (_vehicle emptyPositions "commander" > 0) exitWith {
        _unit moveInCommander _vehicle;
        TRACE_1("moveInCommander",_vehicle);
        _slotsOpen = true;
    };

    // Lastly, check if the gunner seat is available
    if (_vehicle emptyPositions "gunner" > 0) exitWith {
        _unit moveInGunner _vehicle;
        _slotsOpen = true;
    };
};

if (!_slotsOpen) exitWith { WARNING_2("no open seats %1->%2",_unit,_vehicle); };

[{ // just for error reporting
    params ["_unit", "_vehicle"];
    (alive _unit) && {alive _vehicle} && {(vehicle _unit) == _vehicle}
}, {
    params ["_unit", "_vehicle"];
    TRACE_2("success",_unit,_vehicle);
}, [_unit, _vehicle], 2, {
    params ["_unit", "_vehicle"];
    if (!alive _unit) exitWith {};
    WARNING_2("timeout %1->%2",_unit,_vehicle);
}] call CBA_fnc_waitUntilAndExecute;
