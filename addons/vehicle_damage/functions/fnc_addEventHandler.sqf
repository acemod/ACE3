#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Adds the event handler to a vehicle.
 *
 * Arguments:
 * 0: The vehicle in which to add the event handler to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank2] call ace_vehicle_damage_fnc_addEventHandler;
 *
 * Public: No
 */

params["_vehicle"];
TRACE_2("addEventHandler",_vehicle,GVAR(enabled));

if !(GVAR(enabled)) exitWith {
    #ifdef DEBUG_MODE_FULL
    [{ ["Warning: Vehicle Damage not enabled...", 2] call CBA_fnc_notify; }, [], 5] call CBA_fnc_waitAndExecute; 
    #endif
};

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
    params ["_vehicle", "_config", "_iterateThroughConfig", "_hitpointAliases"];
    TRACE_1("checking config",_config);
    private _configName = configName _config;
    private _isGun = ([_config >> "isGun", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1;
    private _isTurret = ([_config >> "isTurret", "NUMBER", 0] call CBA_fnc_getConfigEntry) == 1;
    private _isEra = _configName in _eraHitpoints;
    private _isSlat = _configName in _slatHitpoints;
    private _isMisc = false;
    
    // prevent incompatibilites with old mods
    if ((toLower _configName) isEqualTo "hitturret") then {
        _isTurret = true;
    };
    if ((toLower _configName) isEqualTo "hitgun") then {
        _isGun = true;
    };
    
    private _hash = _vehicle getVariable QGVAR(hitpointHash);
    {
        _x params ["_hitType", "_hitPoints"];
        if ((toLower _configName) in _hitPoints) then {
            [_hash, toLower _configName, [_hitType, _config, _configName]] call CBA_fnc_hashSet;
            _isMisc = true;
        };
    } forEach _hitpointAliases;
        
    if (_isGun || _isTurret || _isEra || _isSlat || _isMisc) then {
        TRACE_6("found gun/turret/era/slat/misc",_isGun,_isTurret,_isEra,_isSlat,_isMisc,_hash);
        if (_isGun) then {
            [_hash, toLower _configName, ["gun", _config, _configName]] call CBA_fnc_hashSet;
        };
        if (_isTurret) then {
            [_hash, toLower _configName, ["turret", _config, _configName]] call CBA_fnc_hashSet;
        };
        if (_isEra) then {
            [_hash, toLower _configName, ["era", _config, _configName]] call CBA_fnc_hashSet;
        };
        if (_isSlat) then {
            [_hash, toLower _configName, ["slat", _config, _configName]] call CBA_fnc_hashSet;
        };
        _vehicle setVariable [QGVAR(hitpointHash), _hash];
    } else {
        {
            [_vehicle, _x, _iterateThroughConfig, _hitpointAliases] call _iterateThroughConfig;
        } forEach configProperties [_config, "isClass _x", true];
    };
};

private _hitpointAliases = [_vehicleConfig >> QGVAR(hitpointAlias), "ARRAY", []] call CBA_fnc_getConfigEntry;
TRACE_1("hitpoint alias",_hitpointAliases);
[_vehicle, _hitpointsConfig, _iterateThroughConfig, _hitpointAliases] call _iterateThroughConfig;
[_vehicle, _turretConfig, _iterateThroughConfig, _hitpointAliases] call _iterateThroughConfig;

_vehicle allowCrewInImmobile true;
private _eh = _vehicle getVariable [QGVAR(handleDamage), nil];
if (isNil "_eh") then {
    // no clue why, but for some reason this needs to exec'd next frame or else it isnt the last event handler in the system.
    // Maybe its overridden somewhere else, but this makes sure it is the last one
    [{
        params ["_vehicle"];
        TRACE_1("EH not added yet - added eh now", _vehicle);
        private _hd = _vehicle addEventHandler ["HandleDamage", { _this call FUNC(handleDamage) }];
        _vehicle setVariable [QGVAR(handleDamage), _hd];
    }, [_vehicle]] call CBA_fnc_execNextFrame;
};
