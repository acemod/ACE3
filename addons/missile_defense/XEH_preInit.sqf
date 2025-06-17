#include "script_component.hpp"

ADDON = false;

#include "initSettings.inc.sqf"

GVAR(projectilesToIntercept) = [];

#define SIM_TYPES ["shotMissile", "shotShell", "shotRocket"]

{
    private _simulation = getText (_x >> "simulation");
    if (_simulation in SIM_TYPES) then {
        GVAR(projectilesToIntercept) pushBack configName _x;
    };
    private _submunition = getText (_x >> "submunitionAmmo");
    if (_submunition != "") then {
        private _submunitionConfig = configFile >> "CfgAmmo" >> _submunition;
        private _simulation = getText (_submunitionConfig >> "simulation");
        if (_simulation in SIM_TYPES) then {
            GVAR(projectilesToIntercept) pushBack configName _x;
        };
    };
} forEach ("true" configClasses (configFile >> "CfgAmmo"));

["All", "fired", {
    params ["_unit", "", "", "", "", "", "_projectile"];
    TRACE_1("Fired projectile",_projectile);
    _projectile setVariable [QGVAR(side), side _unit];
    if (local _projectile && { (typeOf _projectile) in GVAR(projectilesToIntercept) }) then {
        [QGVAR(track), [_projectile]] call CBA_fnc_serverEvent;
    };
    _projectile addEventHandler ["SubmunitionCreated", {
        params ["_projectile", "_submunitionProjectile"];
        if ((getPosATL _submunitionProjectile) select 2 < 500) exitWith {};
        _submunitionProjectile setVariable [QGVAR(side), _projectile getVariable [QGVAR(side), side _projectile]];
        TRACE_1("Submunition created",_submunitionProjectile);
        if (local _submunitionProjectile && { (typeOf _submunitionProjectile) in GVAR(projectilesToIntercept) }) then {
            [QGVAR(track), [_submunitionProjectile]] call CBA_fnc_serverEvent;
        };
    }];
}] call CBA_fnc_addClassEventHandler;

[QGVAR(registerLauncher), {
    params ["_id", "_launcher"];
    if (local _launcher) then {
        _launcher addEventHandler ["Fired", {
            params ["_launcher", "", "", "", "", "", "_projectile"];
            private _target = _launcher getVariable [QEGVAR(missileguidance,target), objNull];
            private _system = _launcher getVariable [QGVAR(system), objNull];
            if !(isNull _target) then {
                [QGVAR(registerInterceptor), [_system, _projectile, _target]] call CBA_fnc_serverEvent;
            };
        }];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(destroyProjectile), {
    params ["_projectile"];
    deleteVehicle _projectile;
}] call CBA_fnc_addEventHandler;

ADDON = true;
