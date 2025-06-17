#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(systems) = createHashMap;

[QGVAR(track), {
    params ["_projectile"];
    TRACE_1("Tracking projectile",_projectile);
    {
        (_y getOrDefault ["targets_possible", []]) pushBackUnique _projectile;
    } forEach GVAR(systems);
}] call CBA_fnc_addEventHandler;

[QGVAR(registerInterceptor), {
    params ["_id", "_interceptor", "_target"];
    private _system = GVAR(systems) getOrDefault [_id, -1];
    if (_system isEqualTo -1) exitWith {
        ERROR_1("Missile defense system with ID '%1' does not exist",_id);
    };
    _system getOrDefault ["interceptors", []] pushBack [_interceptor, _target, getPosASLVisual _interceptor, _interceptor distance _target];
    TRACE_2("Registered interceptor",_interceptor,_target);
}] call CBA_fnc_addEventHandler;

ADDON = true;
