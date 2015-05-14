#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (viewDistance > GVAR(limitViewDistance)) then {
    setViewDistance GVAR(limitViewDistance); // force the view distance down to the limit.
    setObjectViewDistance (0.8 * GVAR(limitViewDistance));
} else {
    [true] call FUNC(adaptViewDistance); // adapt view distance in the beginning according to whether client is on foot or vehicle.
};

// Set the EH which waits for any of the view distance settings to be changed, avoids the player having to enter or leave a vehicle for the changes to have effect.
["SettingChanged",{
    if ((_this select 0  == QGVAR(viewDistanceOnFoot)) || (_this select 0  == QGVAR(viewDistanceLandVehicle)) || (_this select 0  == QGVAR(viewDistanceAirVehicle))) then {
        [true] call FUNC(adaptViewDistance);
    };
},true] call ace_common_fnc_addEventHandler;

// Set the EH which waits for the Object View Distance coefficient to be changed, so that the effect is show immediately
["SettingChanged",{
    if (_this select 0  == QGVAR(objectViewDistanceCoeff)) then {
        [true] call FUNC(adaptViewDistance);
    };
},true] call ace_common_fnc_addEventHandler;

// Set the EH which waits for a vehicle change to automatically swap to On Foot/In Land Vehicle/In Air Vehicle
["playerVehicleChanged",{[false] call FUNC(adaptViewDistance)},true] call ace_common_fnc_addEventHandler;