#include "script_component.hpp"

[QGVAR(setVehicleDamage), {_this call FUNC(setDamage)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleHitPointDamage), {_this call FUNC(setHitPointDamage)}] call CBA_fnc_addEventHandler;

// wheels
[QGVAR(setWheelHitPointDamage), {(_this select 0) setHitPointDamage [_this select 1, _this select 2]}] call CBA_fnc_addEventHandler;

if (isServer) then {
    ["ace_settingsInitialized", {
        TRACE_1("ace_settingsInitialized eh", GVAR(addSpareParts));
        if (!GVAR(addSpareParts)) exitWith {};
        if (!(["ace_cargo"] call EFUNC(common,isModLoaded))) exitWith {};

        ["Car", "Init", {[_this select 0, 1, "ACE_Wheel"] call FUNC(addSpareParts)}, true, [], true] call CBA_fnc_addClassEventHandler;
        ["Tank", "Init", {[_this select 0, 1, "ACE_Track"] call FUNC(addSpareParts)}, true, [], true] call CBA_fnc_addClassEventHandler;
    }] call CBA_fnc_addEventHandler;
};
