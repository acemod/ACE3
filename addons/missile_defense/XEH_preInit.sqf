#include "script_component.hpp"

ADDON = false;

#include "initSettings.inc.sqf"

GVAR(trackingHandle) = -1;
[QGVAR(startTracking), {
    if (GVAR(trackingHandle) != -1) exitWith {};
    GVAR(trackingHandle) = ["All", "fired", {
        params ["_unit", "", "", "", "", "", "_projectile"];

        // Handle interceptors from launchers
        if (local _unit) then {
            private _system = _unit getVariable [QGVAR(system), ""];
            if (_system != "") then {
                private _target = _unit getVariable [QEGVAR(missileguidance,target), objNull];
                if !(isNull _target) then {
                    [QGVAR(registerInterceptor), [_system, _projectile, _target]] call CBA_fnc_serverEvent;
                };
            };
        };

        // Handle profile that should be tracked
        TRACE_1("Fired projectile",_projectile);
        _projectile setVariable [QGVAR(side), side _unit];
        private _toIntercept = uiNamespace getVariable QGVAR(projectilesToIntercept);
        if (local _projectile && { (typeOf _projectile) in _toIntercept }) then {
            [QGVAR(track), [_projectile, side _unit]] call CBA_fnc_serverEvent;
        };
        _projectile addEventHandler ["SubmunitionCreated", {
            params ["_projectile", "_submunitionProjectile"];
            if ((getPosATL _submunitionProjectile) select 2 < 500) exitWith {};
            private _side = _projectile getVariable [QGVAR(side), side _projectile];
            _submunitionProjectile setVariable [QGVAR(side), _side];
            TRACE_1("Submunition created",_submunitionProjectile);
            private _toIntercept = uiNamespace getVariable QGVAR(projectilesToIntercept);
            if (local _submunitionProjectile && { (typeOf _submunitionProjectile) in _toIntercept }) then {
                [QGVAR(track), [_submunitionProjectile, _side]] call CBA_fnc_serverEvent;
            };
        }];
    }] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;

[QGVAR(destroyProjectile), {
    params ["_target", "_type", "_position"];
    if !(isNull _target) exitWith {
        deleteVehicle _target;
        TRACE_1("Destroyed projectile using object",_target);
    };
    private _near = nearestObjects [_position, [_type], GVAR(destroyRadius)];
    if (_near isNotEqualTo []) then {
        TRACE_2("Destroying nearby entities of type",_type,_near);
        deleteVehicle _near;
    } else {
        TRACE_2("No nearby entities of type to destroy",_type,_position);
        private _nearest = nearestObject [_position, _type];
        deleteVehicle _nearest;
    };
}] call CBA_fnc_addEventHandler;

ADDON = true;
