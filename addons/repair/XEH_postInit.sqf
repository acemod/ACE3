#include "script_component.hpp"

["setVehicleDamage", {_this call FUNC(setDamage)}] call CBA_fnc_addEventHandler;
["setVehicleHitPointDamage", {_this call FUNC(setHitPointDamage)}] call CBA_fnc_addEventHandler;

// wheels
["setWheelHitPointDamage", {(_this select 0) setHitPointDamage [_this select 1, _this select 2]}] call CBA_fnc_addEventHandler;
