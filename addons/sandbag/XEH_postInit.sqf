#include "script_component.hpp"

if (isServer) then {
    // Cancel deploy on hard disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
};

if (!hasInterface) exitWith {};

GVAR(sandBag) = objNull;
GVAR(deployPFH) = -1;
GVAR(deployDirection) = 0;

// Cancel deploy sandbag if interact menu opened
["interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel deploy on player change. This does work when returning to lobby, but not when hard disconnecting.
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;
["playerInventoryChanged", {_this call FUNC(handlePlayerInventoryChanged)}] call CBA_fnc_addEventHandler;
["playerVehicleChanged", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;

// handle waking up dragged unit and falling unconscious while dragging
["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

//@todo Captivity?
