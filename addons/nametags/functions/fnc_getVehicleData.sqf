/*
 * Author: aeroson
 * Gathers and caches data needed by AGM_CrewInfo_fnc_doShow.
 * What really does make difference for the engine is simulation of CfgAmmo.
 * Priority of roles  is: driver/pilot, gunner, copilot, commander, FFV, cargo.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Data <ARRAY>
 * 0: Vehicle inherits from Air <BOOL>
 * 1: Categorized vehicle's turrets <ARRAY>
 *
 * Example:
 * call ace_nametags_fnc_updateSettings
 *
 * Public: No
 */
#include "script_component.hpp"
#include "common.hpp";

private ["_type", "_varName", "_data", "_isAir", "_config", "_fnc_addTurret", "_fnc_addTurretUnit"];

PARAMS_1(_type);

_varName = format ["ACE_CrewInfo_Cache_%1", _type];
_data = + (uiNamespace getVariable _varName);

if (!isNil "_data") exitWith {_data};

_data = [];
_isAir = _type isKindOf "Air";

_fnc_addTurretUnit = {
    private  ["_config", "_path", "_role", "_simulationEmpty", "_simulationLaserDesignate", "_simulationOther", "_magazine", "_ammo", "_simulation"];

    _config = _this select 0;
    _path = _this select 1;
    _role = CARGO;

    _simulationEmpty = 0;
    _simulationLaserDesignate = 0;
    _simulationOther = 0;
    {
        {
            _magazine = configFile >> "CfgMagazines" >> _x;
            _ammo = configFile >> "CfgAmmo" >> getText (_magazine >> "ammo");
            _simulation = getText (_ammo >> "simulation");

            if(_simulation=="") then {
                _simulationEmpty = _simulationEmpty + 1;
            } else {
                if(_simulation=="laserDesignate") then {
                    _simulationLaserDesignate = _simulationLaserDesignate + 1;
                } else {
                    _simulationOther = _simulationOther + 1;
                };
            };

        } forEach getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
    } forEach getArray (_config >> "weapons");

    if(_simulationOther>0) then {
        _role = GUNNER;
    };
    if (_role == CARGO && {getNumber (_config >> "isCopilot") == 1}) then {
        _role = COPILOT;
    };
    if (_role == CARGO && {_simulationLaserDesignate>0 || getNumber (_config >> "primaryObserver") == 1}) then {
        _role = COMMANDER;
    };
    if (_role == CARGO && {getNumber (_config >> "isPersonTurret") == 1}) then {
        _role = FFV;
    };

    _data pushBack [_path, _role];  
};


_fnc_addTurret = {

    private ["_config", "_path", "_count", "_offset", "_index", "_turretPath", "_turretConfig"];

    _config = _this select 0;
    _path = _this select 1;

    _config = _config >> "Turrets";
    _count = count _config;

    _offset = 0;    

    for "_index" from 0 to (_count - 1) do {
        _turretPath = _path + [_index - _offset];
        _turretConfig = _config select _index;
        if (isClass _turretConfig) then {           
            [_turretConfig, _turretPath] call _fnc_addTurretUnit;
            [_turretConfig, _turretPath] call _fnc_addTurret;
        } else {
            _offset = _offset + 1;
        };
    };
};


_config = configFile >> "CfgVehicles" >> _type;
[_config, []] call _fnc_addTurret;

_data = [_isAir, _data];
uiNamespace setVariable [_varName, _data];

_data
