#include "script_component.hpp"

["setVehicleDamage", {_this call FUNC(setDamage)}] call EFUNC(common,addEventHandler);
["setVehicleHitPointDamage", {_this call FUNC(setHitPointDamage)}] call EFUNC(common,addEventHandler);

// wheels
["setWheelHitPointDamage", {(_this select 0) setHitPointDamage [_this select 1, _this select 2]}] call EFUNC(common,addEventHandler);

if (isServer) then {
    ["SettingsInitialized", {
        GVAR(settingInitted) = true; // Stop collecting in FUNC(addSpareParts)

        // Exit if adding spare parts disabled and clean collection
        if (!GVAR(addSpareParts)) exitWith {GVAR(addSparePartsCollection) = nil};

        // Add spare parts to vehicles in collection
        {
            [_x] call FUNC(addSpareParts);
        } forEach GVAR(addSparePartsCollection);

        // Clean collection
        GVAR(addSparePartsCollection) = nil;
    }] call EFUNC(common,addEventHandler);
};
