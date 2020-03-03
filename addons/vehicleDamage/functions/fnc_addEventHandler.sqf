#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Adds the event handler to a vehicle
 *
 * Arguments:
 * 0: The vehicle in which to add the event handler to
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank2] call ace_vehicleDamage_fnc_addEventHandler;
 *
 * Public: No
 */
params["_vehicle"];
TRACE_2("addEventHandler",_vehicle,GVAR(enabled));

if !(GVAR(enabled)) exitWith {};

private _hitpointHash = [[], nil] call CBA_fnc_hashCreate;
private _vehicleConfig = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _hitpointsConfig = _vehicleConfig >> "HitPoints";
private _turretConfig = _vehicleConfig >> "Turrets";
private _eraHitpoints = [_vehicleConfig >> QGVAR(eraHitpoints), "ARRAY", []] call CBA_fnc_getConfigEntry;
private _slatHitpoints = [_vehicleConfig >> QGVAR(slatHitpoints), "ARRAY", []] call CBA_fnc_getConfigEntry;

// Add hitpoint names to config for quick lookup
{
    _x params ["_hitpoints", "_type"];
    {
        [_hitpointHash, toLower _x, [_type, _hitpointsConfig >> _x, _x]] call CBA_fnc_hashSet;
    } forEach _hitpoints;
} forEach ALL_HITPOINTS;

_vehicle setVariable [QGVAR(hitpointHash), _hitpointHash];

// gun and turret hitpoints arent hardcoded anymore - dig through config to find correct names
private _iterateThroughConfig = {
    params ["_vehicle", "_config", "_iterateThroughConfig"];
    TRACE_1("checking config",_config);
    private _isGun = ([_config >> "isGun", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1;
    private _isTurret = ([_config >> "isTurret", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1;
    private _isEra = (configName _config) in _eraHitpoints;
    private _isSlat = (configName _config) in _slatHitpoints;
    
    if (_isGun || _isTurret || _isEra || _isSlat)then {
        private _hash = _vehicle getVariable QGVAR(hitpointHash);
        TRACE_5("found gun/turret/era/slat",_isGun,_isTurret,_isEra,_isSlat,_hash);
        if (_isGun) then {
            [_hash, toLower configName _config, ["gun", _config, configName _config]] call CBA_fnc_hashSet;
        };
        if (_isTurret) then {
            [_hash, toLower configName _config, ["turret", _config, configName _config]] call CBA_fnc_hashSet;
        };
        if (_isEra) then {
            [_hash, toLower configName _config, ["era", _config, configName _config]] call CBA_fnc_hashSet;
        };
        if (_isSlat) then {
            [_hash, toLower configName _config, ["slat", _config, configName _config]] call CBA_fnc_hashSet;
        };
        _vehicle setVariable [QGVAR(hitpointHash), _hash];
    } else {
        {
            [_vehicle, _x, _iterateThroughConfig] call _iterateThroughConfig;
        } forEach configProperties [_config, "isClass _x", true];
    };
};
[_vehicle, _hitpointsConfig, _iterateThroughConfig] call _iterateThroughConfig;
[_vehicle, _turretConfig, _iterateThroughConfig] call _iterateThroughConfig;

_vehicle allowCrewInImmobile true;
private _eh = _vehicle getVariable [QGVAR(handleDamage), nil];
if (isNil "_eh") then {
    TRACE_1("added eh", _vehicle);
    private _hd = _vehicle addEventHandler ["HandleDamage", { _this call FUNC(handleDamage); }];
    _vehicle setVariable [QGVAR(handleDamage), _hd];
};

