#include "script_component.hpp"

["setVehicleDamage", {_this call FUNC(setDamage)}] call EFUNC(common,addEventHandler);
["setVehicleHitPointDamage", {_this call FUNC(setHitPointDamage)}] call EFUNC(common,addEventHandler);

// wheels
["setWheelHitPointDamage", {(_this select 0) setHitPointDamage [_this select 1, _this select 2]}] call EFUNC(common,addEventHandler);
