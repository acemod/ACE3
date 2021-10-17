#include "script_component.hpp"

["ace_settingsInitialized", {
    // Register and remove HCs if not client that is not server and distribution or end mission enabled
    if ((!hasInterface || isServer) && {XGVAR(enabled) || XGVAR(endMission) != 0}) then {
        if (isServer) then {
            // Request rebalance on any unit spawn (only if distribution enabled)
            if (XGVAR(enabled)) then {
                ["AllVehicles", "init", FUNC(handleSpawn), nil, nil, true] call CBA_fnc_addClassEventHandler;
            };
            // Add disconnect EH
            addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
        } else {
            // Register HC (this part happens on HC only)
            [QXGVAR(headlessClientJoined), [player]] call CBA_fnc_globalEvent; // Global event for API purposes
        };

        // Transfer loadouts (naked unit work-around)
        if (XGVAR(transferLoadout) > 0) then {
            ["CAManBase", "Local", {
                params ["_unit", "_local"];

                // Check if naked unit bug happened
                if (_local && {uniform _unit == ""}) then {
                    INFO_1("Unit [%1] became local with broken loadout - attempting to fix",_unit);
                    if (XGVAR(transferLoadout) == 1) then {
                        // Transferred loadout, if unavailable reset to config default (still better than naked)
                        _unit setUnitLoadout (_unit getVariable [QGVAR(loadout), typeOf _unit]);
                    } else {
                        // Config default loadout
                        _unit setUnitLoadout (typeOf _unit);
                    };
                };
            }] call CBA_fnc_addClassEventHandler;
        };
    };
}] call CBA_fnc_addEventHandler;
