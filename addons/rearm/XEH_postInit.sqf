#include "script_component.hpp"

["medical_onUnconscious", {_this call FUNC(handleOnUnconscious)}] call EFUNC(common,addEventHandler);
["playerVehicleChanged", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}] call EFUNC(common,addEventHandler);
