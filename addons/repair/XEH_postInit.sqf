#include "script_component.hpp"

["setVehicleDamage", {_this call FUNC(setDamage)}] call EFUNC(common,addEventHandler);
["setVehicleHitPointDamage", {_this call FUNC(setHitPointDamage)}] call EFUNC(common,addEventHandler);
