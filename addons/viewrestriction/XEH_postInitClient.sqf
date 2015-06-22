#include "script_component.hpp"

// Exit on Server and Headless
if !(hasInterface) exitWith {};

// Exit if third person view is not available
if !(difficultyEnabled "3rdPersonView") exitWith {};

["SettingsInitialized", {
    // Exit if module is disabled
    if (GVAR(mode) == 0) exitWith {};

    // Start proper PFH based on mode (separated from one PFH with many conditions to improve performance)

    // Conditions with cameraView results in visible transitions, ongoing use of switchCamera does not
    // UAVs break without cameraView condition (control returns to player object, camera is left on UAV object)
    // UAVs are therefore left out of this module until fixed or suitable work-around is found
    #define IS_UAV (cameraOn isKindOf "UAV" || {cameraOn isKindOf "UAV_01_base_F"})

    // FirstPerson
    if (GVAR(mode) == 1) exitWith {
        [{
            if (isNull ACE_player || {!alive ACE_player}) exitWith {};

            if (IS_UAV) exitWith {
                // Reference comment in XEH_postInitClient.sqf, beginning of "SettingsInitialized" Event Handler
            };
            cameraOn switchCamera "Internal";
        }, 0, []] call cba_fnc_addPerFrameHandler;
    };

    // ThirdPerson
    if (GVAR(mode) == 2) exitWith {
        [{
            if (isNull ACE_player || {!alive ACE_player}) exitWith {};

            if (IS_UAV) exitWith {
                // Reference comment in XEH_postInitClient.sqf, beginning of "SettingsInitialized" Event Handler
            };
            cameraOn switchCamera "External";
        }, 0, []] call cba_fnc_addPerFrameHandler;
    };

    // Selective
    if (GVAR(mode) == 3) exitWith {
        // Exit if all Selective Modes are Disabled
        if (GVAR(modeSelectiveFoot) == 0 && {GVAR(modeSelectiveVehicle) == 0} && {GVAR(modeSelectiveAir) == 0} && {GVAR(modeSelectiveUAV) == 0}) exitWith {diag_log "selective disabled due to submodes"};

        [{
            if (isNull ACE_player || {!alive ACE_player}) exitWith {};

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
            if (IS_UAV) exitWith {
                // Reference comment in XEH_postInitClient.sqf, beginning of "SettingsInitialized" Event Handler
                /*if (GVAR(modeSelectiveUAV) == 1) exitWith {
                    cameraOn switchCamera "Internal";
                };
                if (GVAR(modeSelectiveUAV) == 2) exitWith {
                    cameraOn switchCamera "External";
                };*/
            };

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
        }, 0, []] call cba_fnc_addPerFrameHandler;
    };
}] call EFUNC(common,addEventHandler);
