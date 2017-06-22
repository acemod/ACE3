/*
 * Author: commy2
 * Move unit into given vehicle position or switch to that position if the unit is already inside the vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Position ("Driver", "Pilot", "Gunner", "Commander", "Copilot", "Turret", "FFV", "Codriver", "Cargo") <STRING>
 * 3: Index (only applies to "Turret", "FFV", "Codriver", "Cargo") (default: next free index) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "Driver", 5] call ace_common_fnc_getInPosition
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define CANGETINDRIVER      (isNull (driver _vehicle)             || {!alive driver _vehicle})               && {!lockedDriver _vehicle}           && {getNumber (_config >> "isUav") != 1}
#define CANGETINTURRETINDEX (isNull (_vehicle turretUnit _turret) || {!alive (_vehicle turretUnit _turret)}) && {!(_vehicle lockedTurret _turret)} && {getNumber (_config >> "isUav") != 1}

params ["_unit", "_vehicle", "_position", ["_index", -1]];

_position = toLower _position;

// general
if (!alive _vehicle || {locked _vehicle > 1}) exitWith {false};

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _turret = [];

private _isInside = vehicle _unit == _vehicle;

private _script = {};
private _enemiesInVehicle = false;   //Possible Side Restriction

{
    if (side _unit getFriend side _x < 0.6) exitWith {_enemiesInVehicle = true};
    false
} count crew _vehicle;

switch (_position) do {
    case "driver" : {
        if (CANGETINDRIVER) then {
            _script = [
                {_unit action [["GetInDriver", "MoveToDriver"] select _isInside, _vehicle];},
                {if (_isInside) then {moveOut _unit}; _unit moveInDriver _vehicle; call _fnc_getInEH;}
            ] select _enemiesInVehicle;
        };
    };

    case "pilot" : {
        if (CANGETINDRIVER) then {
            _script = [
                {_unit action [["GetInPilot", "MoveToPilot"] select _isInside, _vehicle];},
                {if (_isInside) then {moveOut _unit}; _unit moveInDriver _vehicle; call _fnc_getInEH;}
            ] select _enemiesInVehicle;
            _position = "driver";
        };
    };

    case "gunner" : {
        _turret = [_vehicle] call FUNC(getTurretGunner);

        if (CANGETINTURRETINDEX) then {
            _script = [
                {_unit action [["GetInGunner", "MoveToGunner"] select _isInside, _vehicle];},
                {if (_isInside) then {moveOut _unit}; _unit moveInGunner _vehicle; call _fnc_getInEH;}
            ] select _enemiesInVehicle;
        };
    };

    case "commander" : {
        _turret = [_vehicle] call FUNC(getTurretCommander);

        if (CANGETINTURRETINDEX) then {
            _script = [
                {_unit action [["GetInCommander", "MoveToCommander"] select _isInside, _vehicle];},
                {if (_isInside) then {moveOut _unit}; _unit moveInCommander _vehicle; call _fnc_getInEH;}
            ] select _enemiesInVehicle;
        };
    };

    case "copilot" : {
        _turret = [_vehicle] call FUNC(getTurretCopilot);

        if (CANGETINTURRETINDEX) then {
            _script = [
                {_unit action [["GetInTurret", "moveToTurret"] select _isInside, _vehicle, _turret];},
                {if (_isInside) then {moveOut _unit}; _unit moveInTurret [_vehicle, _turret]; call _fnc_getInEH;}
            ] select _enemiesInVehicle;

            _position = "gunner";  // I think. It's a turret after all and turrets supposedly return "gunner"
        };
    };

    case "turret" : {
        private _turrets = [_vehicle] call FUNC(getTurretsOther);

        if (_index != -1 && {_turret = _turrets select _index; CANGETINTURRETINDEX}) then {
            _script = [
                {_unit action [["GetInTurret", "moveToTurret"] select _isInside, _vehicle, _turret];},
                {if (_isInside) then {moveOut _unit}; _unit moveInTurret [_vehicle, _turret]; call _fnc_getInEH;}
            ] select _enemiesInVehicle;

            _position = "gunner";
        } else {
            for "_index" from 0 to (count _turrets - 1) do {
                _turret = _turrets select _index;
                if (CANGETINTURRETINDEX) exitWith {
                    _script = [
                        {_unit action [["GetInTurret", "moveToTurret"] select _isInside, _vehicle, _turret];},
                        {if (_isInside) then {moveOut _unit}; _unit moveInTurret [_vehicle, _turret]; call _fnc_getInEH;}
                    ] select _enemiesInVehicle;

                    _position = "gunner";
                };
            };
        };
    };

    case "ffv" : {
        private _turrets = [_vehicle] call FUNC(getTurretsFFV);

        if (_index != -1 && {_turret = _turrets select _index; CANGETINTURRETINDEX}) then {
            _script = [
                {_unit action [["GetInTurret", "moveToTurret"] select _isInside, _vehicle, _turret];},
                {if (_isInside) then {moveOut _unit}; _unit moveInTurret [_vehicle, _turret]; call _fnc_getInEH;}
            ] select _enemiesInVehicle;

            _position = "gunner";  // I think. It's a turret after all and turrets supposedly return "gunner"
        } else {
            for "_index" from 0 to (count _turrets - 1) do {
                _turret = _turrets select _index;
                if (CANGETINTURRETINDEX) exitWith {
                    _script = [
                        {_unit action [["GetInTurret", "moveToTurret"] select _isInside, _vehicle, _turret];},
                        {if (_isInside) then {moveOut _unit}; _unit moveInTurret [_vehicle, _turret]; call _fnc_getInEH;}
                    ] select _enemiesInVehicle;

                    _position = "gunner";  // I think. It's a turret after all and turrets supposedly return "gunner"
                };
            };
        };
    };

    case "codriver" : {
        private _positions = [typeOf _vehicle] call FUNC(getVehicleCodriver);

        {
            if (alive _x) then {_positions deleteAt (_positions find (_vehicle getCargoIndex _x))};
        } forEach crew _vehicle;

        if (_index != -1 && {_index in _positions}) then {
            _script = [
                {_unit action [["GetInCargo", "MoveToCargo"] select _isInside, _vehicle, _index];},
                {if (_isInside) then {moveOut _unit}; _unit moveInCargo [_vehicle, _index]; call _fnc_getInEH;}
            ] select _enemiesInVehicle;

            _position = "cargo";
        } else {
            _index = _positions select 0;
            if (!isNil "_index") then {
                _script = [
                    {_unit action [["GetInCargo", "MoveToCargo"] select _isInside, _vehicle, _index];},
                    {if (_isInside) then {moveOut _unit}; _unit moveInCargo [_vehicle, _index]; call _fnc_getInEH;}
                ] select _enemiesInVehicle;

                _position = "cargo";
            };
        };
    };

    case "cargo" : {
        private _positions = [typeOf _vehicle] call FUNC(getVehicleCargo);

        {
            if (alive _x) then {_positions deleteAt (_positions find (_vehicle getCargoIndex _x))};
        } forEach crew _vehicle;

        if (_index != -1 && {_index in _positions}) then {
            _script = [
                {_unit action [["GetInCargo", "MoveToCargo"] select _isInside, _vehicle, _index];},
                {if (_isInside) then {moveOut _unit}; _unit moveInCargo [_vehicle, _index]; call _fnc_getInEH;}
            ] select _enemiesInVehicle;

            _position = "cargo";
        } else {
            _index = _positions select 0;
            if (!isNil "_index") then {
                _script = [
                    {_unit action [["GetInCargo", "MoveToCargo"] select _isInside, _vehicle, _index];},
                    {if (_isInside) then {moveOut _unit}; _unit moveInCargo [_vehicle, _index]; call _fnc_getInEH;}
                ] select _enemiesInVehicle;

                _position = "cargo";
            };
        };
    };

    default {};
};

// this will execute all config based event handlers. Not script based ones unfortunately, but atleast we don't use any.
private _fnc_getInEH = {
    // config based getIn EHs are assigned to the soldier, not the vehicle. Why Bis? Why?
    private _config = configFile >> "CfgVehicles" >> typeOf _unit >> "EventHandlers";

    if (isClass _config) then {
        //getIn is local effects with global arguments. It doesn't trigger if the unit was already inside and only switched seats
        if !(_isInside) then {
            [_vehicle, _position, _unit, _turret] call compile getText (_config >> "getIn");
        };
    };
};

// if you want into the cargo and you can't, then check ffv turrets aswell
if (_position == "cargo") exitWith {
    if (_script isEqualTo {}) then {
        [_unit, _vehicle, "ffv"] call FUNC(getInPosition);
    } else {
        call _script;
    };
};

call _script;

/*
  sleep 0.1;
  if ((vehicle _unit) != _vehicle) then {
    ["fn_getInPosition.sqf - Side Restriction, failed to move _unit into vehicle"] call bis_fnc_error;
    _unit moveInAny _vehicle;  //attempt to fail gracefully
  };
*/
