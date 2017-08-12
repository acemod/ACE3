/*
 * Author: commy2
 * Is the unit able to enter the vehicle in the given position?
 *
 * Arguments:
 * 0: Unit to enter the vehicle <OBJECT>
 * 1: The vehicle to be entered <OBJECT>
 * 2: Position. Can be "Driver", "Pilot", "Gunner", "Commander", "Copilot", "Turret", "FFV", "Codriver" or "Cargo" <STRING>
 * 3: Check current distance to vehicles memory point? (default: false) <BOOL>
 * 4: Index. "Turret", "FFV", "Codriver" and "Cargo" support this optional parameter. Which position should be taken. Note: This index is different from Armas "cargoIndex". (default: next free index) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, car, "Pilot", true, "Turret"] call ace_common_fnc_canGetInPosition
 *
 * Public: No
 */
#include "script_component.hpp"

#define CANGETINDRIVER      (isNull (driver _vehicle)             || {!alive driver _vehicle})               && {!lockedDriver _vehicle}           && {getNumber (_config >> "isUav") != 1}
#define CANGETINTURRETINDEX (isNull (_vehicle turretUnit _turret) || {!alive (_vehicle turretUnit _turret)}) && {!(_vehicle lockedTurret _turret)} && {getNumber (_config >> "isUav") != 1}

params ["_unit", "_vehicle", "_position", ["_checkDistance", false], ["_index", -1]];

_position = toLower _position;

// general
if (!alive _vehicle || {locked _vehicle > 1}) exitWith {false};

private ["_selectionPosition", "_selectionPosition2"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _turret = [];

private _radius = 0;

private _enemiesInVehicle = false;   //Possible Side Restriction
{
    if (side _unit getFriend side _x < 0.6) exitWith {_enemiesInVehicle = true};
} forEach crew _vehicle;

private _return = false;
switch (_position) do {
    case "driver" : {
        _radius = getNumber (_config >> "getInRadius");
        _selectionPosition = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInDriver"));

        if (_vehicle isKindOf "Tank") then {
            _selectionPosition2 = [-(_selectionPosition select 0), _selectionPosition select 1, _selectionPosition select 2];
        };

        _return = CANGETINDRIVER;
    };

    case "pilot" : {
        _radius = getNumber (_config >> "getInRadius");
        _selectionPosition = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInDriver"));

        _return = CANGETINDRIVER;
    };

    case "gunner" : {
        _turret = [_vehicle] call FUNC(getTurretGunner);
        if (_turret isEqualTo []) exitWith {false};

        private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

        _radius = getNumber (_config >> "getInRadius");
        _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

        _return = CANGETINTURRETINDEX
    };

    case "commander" : {
        _turret = [_vehicle] call FUNC(getTurretCommander);
        if (_turret isEqualTo []) exitWith {false};

        private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

        _radius = getNumber (_config >> "getInRadius");
        _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

        _return = CANGETINTURRETINDEX
    };

    case "copilot" : {
        _turret = [_vehicle] call FUNC(getTurretCopilot);
        if (_turret isEqualTo []) exitWith {false};

        private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

        _radius = getNumber (_config >> "getInRadius");
        _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

        _return = CANGETINTURRETINDEX
    };

    case "turret" : {
        private _turrets = [_vehicle] call FUNC(getTurretsOther);

        if (_index != -1 && {_turret = _turrets select _index;
          CANGETINTURRETINDEX
        }) then {
            private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

            _radius = getNumber (_config >> "getInRadius");
            _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

            _return = true
        } else {
            for "_index" from 0 to (count _turrets - 1) do {
                _turret = _turrets select _index;
                if (CANGETINTURRETINDEX) exitWith {
                    private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

                    _radius = getNumber (_config >> "getInRadius");
                    _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

                    _return = true
                };
            };
        };
    };

    case "ffv" : {
        private _turrets = [_vehicle] call FUNC(getTurretsFFV);

        if (_index != -1 && {_turret = _turrets select _index;
          CANGETINTURRETINDEX
        }) then {
            private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

            _radius = getNumber (_config >> "getInRadius");
            _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

            _return = true
        } else {
            for "_index" from 0 to (count _turrets - 1) do {
                _turret = _turrets select _index;
                if (CANGETINTURRETINDEX) exitWith {
                    private _turretConfig = [_config, _turret] call FUNC(getTurretConfigPath);

                    _radius = getNumber (_config >> "getInRadius");
                    _selectionPosition = _vehicle selectionPosition (getText (_turretConfig >> "memoryPointsGetInGunner"));

                    _return = true
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
            _radius = getNumber (_config >> "getInRadius");
            _selectionPosition = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInCargo"));

            if (_vehicle isKindOf "Car" && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
              _selectionPosition2 = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInDriver"));
              _selectionPosition2 set [0, -(_selectionPosition2 select 0)];
            };

            _return = true
        } else {
            _index = _positions select 0;
            if (!isNil "_index") then {
                _radius = getNumber (_config >> "getInRadius");
                _selectionPosition = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInCargo"));

                if (_vehicle isKindOf "Car" && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
                    _selectionPosition2 = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInDriver"));
                    _selectionPosition2 set [0, -(_selectionPosition2 select 0)];
                };

                _return = true
            };
        };
    };

    case "cargo" : {
        private _positions = [typeOf _vehicle] call FUNC(getVehicleCargo);

        {
            if (alive _x) then {_positions deleteAt (_positions find (_vehicle getCargoIndex _x))};
        } forEach crew _vehicle;

        if (_index != -1 && {_index in _positions}) then {
            _radius = getNumber (_config >> "getInRadius");
            _selectionPosition = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInCargo"));

            if (_vehicle isKindOf "Car" && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
              _selectionPosition2 = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInDriver"));
              _selectionPosition2 set [0, -(_selectionPosition2 select 0)];
            };

            _return = true
        } else {

            _index = _positions select 0;
            if (!isNil "_index") then {
                _radius = getNumber (_config >> "getInRadius");
                _selectionPosition = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInCargo"));

                if (_vehicle isKindOf "Car" && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
                    _selectionPosition2 = _vehicle selectionPosition (getText (_config >> "memoryPointsGetInDriver"));
                    _selectionPosition2 set [0, -(_selectionPosition2 select 0)];
                };

                _return = true
            };
        };
    };

    default {};
};

private _fnc_isInRange = {
    if (_radius == 0) exitWith {true};

    private _unitPosition = getPos _unit;
    private _distance = _unitPosition distance (_vehicle modelToWorldVisual _selectionPosition);

    if (!isNil "_selectionPosition2") then {
        _distance = _distance min (_unitPosition distance (_vehicle modelToWorldVisual _selectionPosition2));
    };

    _distance < _radius
};

// if you want into the cargo and you can't, then check ffv turrets aswell
if (_position == "cargo") exitWith {
    if (_return && {!_checkDistance || {_vehicle == vehicle _unit} || _fnc_isInRange}) then {true} else {
        [_unit, _vehicle, "ffv", _checkDistance] call FUNC(canGetInPosition);
    };
};

_return && {!_checkDistance || {_vehicle == vehicle _unit} || _fnc_isInRange}

//_enemiesInVehicle
