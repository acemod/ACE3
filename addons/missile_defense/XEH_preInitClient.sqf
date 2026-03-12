#include "script_component.hpp"

GVAR(destroyRadius) = 20;

[QGVAR(destroyProjectile), {
    params ["_target", "_type", "_position"];
    if !(isNull _target) exitWith {
        deleteVehicle _target;
        TRACE_1("Destroyed projectile using object",_target);
    };
    private _near = nearestObjects [_position, [_type], GVAR(destroyRadius)];
    if (count _near > 0) then {
        TRACE_2("Destroying nearby entities of type",_type,_near);
        deleteVehicle _near;
    } else {
        TRACE_2("No nearby entities of type to destroy",_type,_position);
        private _nearest = nearestObject [_position, _type];
        deleteVehicle _nearest;
    };
}] call CBA_fnc_addEventHandler;
