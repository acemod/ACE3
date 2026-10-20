#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Adds the event handler to a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_vehicle_damage_fnc_addEventHandler
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_2("addEventHandler",_vehicle,GVAR(enabled));

if (!GVAR(enabled)) exitWith {
    #ifdef DEBUG_MODE_FULL
    [CBA_fnc_notify, ["Warning: Vehicle Damage not enabled", 2], 5] call CBA_fnc_waitAndExecute;
    #endif
};

if (!isNil {_vehicle getVariable QGVAR(handleDamage)}) exitWith {};

if (local _vehicle) then {
    _vehicle allowCrewInImmobile true;
};

// No clue why, but for some reason this needs to be exec'd next frame or else it isn't the last event handler in the system.
// Maybe its overridden somewhere else, but this makes sure it is the last one
[{
    params ["_vehicle"];

    if (!isNil {_vehicle getVariable QGVAR(handleDamage)}) exitWith {};

    TRACE_1("added eh",_vehicle);

    _vehicle setVariable [QGVAR(hitHash), createHashMap];
    _vehicle setVariable [QGVAR(handleDamage), _vehicle addEventHandler ["HandleDamage", {call FUNC(handleDamage)}]];
}, _vehicle] call CBA_fnc_execNextFrame;

private _typeOf = typeOf _vehicle;

if (_typeOf in GVAR(vehicleClassesHitPointHash)) exitWith {};

private _hitPointHash = createHashMap;
private _vehicleConfig = configOf _vehicle;
private _hitPointsConfig = _vehicleConfig >> "HitPoints";

// Add hitpoint names to config for quick lookup
{
    _x params ["_hitPoints", "_hitArea"];

    {
        _hitPointHash set [toLowerANSI _x, [_hitArea, abs getNumber (_hitPointsConfig >> _x >> "minimalHit")]];
    } forEach _hitPoints;
} forEach ALL_HITPOINTS;

// Gun and turret hitpoints aren't hardcoded anymore - dig through config to find correct names
private _fnc_iterateThroughConfig = {
    params ["_config"];
    TRACE_1("checking config",_config);

    private _configName = toLowerANSI configName _config;
    private _isGun = getNumber (_config >> "isGun") == 1;
    private _isTurret = getNumber (_config >> "isTurret") == 1;
    private _isEra = _configName in _eraHitpoints;
    private _isSlat = _configName in _slatHitpoints;
    private _isMisc = false;

    // Prevent incompatibilites with old mods
    if (_configName == "hitturret") then {
        _isTurret = true;
    };

    if (_configName == "hitgun") then {
        _isGun = true;
    };

    {
        _x params ["_hitArea", "_hitPoints"];

        if (_configName in _hitPoints) then {
            _hitPointHash set [_configName, [_hitArea, abs getNumber (_config >> "minimalHit")]];
            _isMisc = true;
        };
    } forEach _hitPointAliases;

    if (_isGun || _isTurret || _isEra || _isSlat || _isMisc) then {
        if (_isGun) then {
            _hitPointHash set [_configName, ["gun", abs getNumber (_config >> "minimalHit")]];
        };
        if (_isTurret) then {
            _hitPointHash set [_configName, ["turret", abs getNumber (_config >> "minimalHit")]];
        };
        if (_isEra) then {
            _hitPointHash set [_configName, ["era", abs getNumber (_config >> "minimalHit")]];
        };
        if (_isSlat) then {
            _hitPointHash set [_configName, ["slat", abs getNumber (_config >> "minimalHit")]];
        };

        TRACE_6("found gun/turret/era/slat/misc",_isGun,_isTurret,_isEra,_isSlat,_isMisc,_hitPointHash);
    } else {
        {
            _x call _fnc_iterateThroughConfig;
        } forEach configProperties [_config, "isClass _x", true];
    };
};

private _turretConfig = _vehicleConfig >> "Turrets";
private _eraHitpoints = (getArray (_vehicleConfig >> QGVAR(eraHitpoints))) apply {toLowerANSI _x};
private _slatHitpoints = (getArray (_vehicleConfig >> QGVAR(slatHitpoints))) apply {toLowerANSI _x};

private _fnc_toLowerCase = {
    _this apply {
        if (_x isEqualType []) then {
            _x call _fnc_toLowerCase
        } else {
            toLowerANSI _x
        };
    };
};

// Convert areas to lower case
private _hitPointAliases = (getArray (_vehicleConfig >> QGVAR(hitpointAlias))) call _fnc_toLowerCase;

TRACE_1("hitpoint alias",_hitPointAliases);

_hitPointsConfig call _fnc_iterateThroughConfig;
_turretConfig call _fnc_iterateThroughConfig;

GVAR(vehicleClassesHitPointHash) set [_typeOf, _hitPointHash];

nil
