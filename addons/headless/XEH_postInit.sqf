#include "script_component.hpp"

// Exit on player clients that are not hosts
if (hasInterface && !isServer) exitWith {};

["SettingsInitialized", {
    // Exit if HC transferring disabled
    if (!GVAR(Enabled)) exitWith {};

    if (isServer) then {
        addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
    } else {
        // Register HC on server (this part happens on HC only)
        ["ACE_HeadlessClientJoined", [player]] call EFUNC(common,serverEvent);
    };
}] call EFUNC(common,addEventHandler);
