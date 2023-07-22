#include "script_component.hpp"
/*
 * Author: Jonpas
 * Changes camera mode based on vehicle type the player is currently occupying.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_viewrestriction_fnc_selectiveChangeCamera
 *
 * Public: No
 */

params ["_cameraOn"];

// Foot
if (_cameraOn isKindOf "CAManBase") exitWith {
    if (XGVAR(modeSelectiveFoot) == 1) exitWith {
        _cameraOn switchCamera "INTERNAL";
    };
    if (XGVAR(modeSelectiveFoot) == 2) exitWith {
        _cameraOn switchCamera "EXTERNAL";
    };
};

// Land Vehicles
if (_cameraOn isKindOf "LandVehicle") exitWith {
    if (XGVAR(modeSelectiveLand) == 1) exitWith {
        _cameraOn switchCamera "INTERNAL";
    };
    if (XGVAR(modeSelectiveLand) == 2) exitWith {
        _cameraOn switchCamera "EXTERNAL";
    };
};

// UAVs (must be evaluated before Air Vehicles due to inheritance tree)
// Disabled - Reference comment in FUNC(canChangeCamera)
/*if (_cameraOn isKindOf "UAV" || {_cameraOn isKindOf "UAV_01_base_F"}) exitWith {
    if (GVAR(modeSelectiveUAV) == 1) exitWith {
        _cameraOn switchCamera "INTERNAL";
    };
    if (GVAR(modeSelectiveUAV) == 2) exitWith {
        _cameraOn switchCamera "EXTERNAL";
    };
};*/

// Air Vehicles (must be evaluated after UAVs due to inheritance tree)
if (_cameraOn isKindOf "Air") exitWith {
    if (XGVAR(modeSelectiveAir) == 1) exitWith {
        _cameraOn switchCamera "INTERNAL";
    };
    if (XGVAR(modeSelectiveAir) == 2) exitWith {
        _cameraOn switchCamera "EXTERNAL";
    };
};

// Sea Vehicles
if (_cameraOn isKindOf "Ship") exitWith {
    if (XGVAR(modeSelectiveSea) == 1) exitWith {
        _cameraOn switchCamera "INTERNAL";
    };
    if (XGVAR(modeSelectiveSea) == 2) exitWith {
        _cameraOn switchCamera "EXTERNAL";
    };
};
