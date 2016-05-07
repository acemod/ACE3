/*
 * Author: Jonpas
 * Changes camera mode based on vehicle type the player is currently occupying.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewrestriction_fnc_selectiveChangeCamera
 *
 * Public: No
 */
#include "script_component.hpp"

// Foot
if (cameraOn isKindOf "CAManBase") exitWith {
    if (GVAR(modeSelectiveFoot) == 1) exitWith {
        cameraOn switchCamera "Internal";
    };
    if (GVAR(modeSelectiveFoot) == 2) exitWith {
        cameraOn switchCamera "External";
    };
};

// Land Vehicles
if (cameraOn isKindOf "LandVehicle") exitWith {
    if (GVAR(modeSelectiveLand) == 1) exitWith {
        cameraOn switchCamera "Internal";
    };
    if (GVAR(modeSelectiveLand) == 2) exitWith {
        cameraOn switchCamera "External";
    };
};

// UAVs (must be evaluated before Air Vehicles due to inheritance tree)
// Disabled - Reference comment in FUNC(canChangeCamera)
/*if (cameraOn isKindOf "UAV" || {cameraOn isKindOf "UAV_01_base_F"}) exitWith {
    if (GVAR(modeSelectiveUAV) == 1) exitWith {
        cameraOn switchCamera "Internal";
    };
    if (GVAR(modeSelectiveUAV) == 2) exitWith {
        cameraOn switchCamera "External";
    };
};*/

// Air Vehicles (must be evaluated after UAVs due to inheritance tree)
if (cameraOn isKindOf "Air") exitWith {
    if (GVAR(modeSelectiveAir) == 1) exitWith {
        cameraOn switchCamera "Internal";
    };
    if (GVAR(modeSelectiveAir) == 2) exitWith {
        cameraOn switchCamera "External";
    };
};

// Sea Vehicles
if (cameraOn isKindOf "Ship") exitWith {
    if (GVAR(modeSelectiveSea) == 1) exitWith {
        cameraOn switchCamera "Internal";
    };
    if (GVAR(modeSelectiveSea) == 2) exitWith {
        cameraOn switchCamera "External";
    };
};
