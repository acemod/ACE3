#include "script_component.hpp"

if (isServer) then {
    // Cancel dig on hard disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
};

if (!hasInterface) exitWith {};

GVAR(trenchId) = 0;
GVAR(trench) = objNull;
GVAR(digPFH) = -1;
GVAR(digDirection) = 0;

[{_this call FUNC(handleScrollWheel)}] call EFUNC(common,addScrollWheelEventHandler);

// Cancel dig sandbag if interact menu opened
["interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call EFUNC(common,addEventHandler);

// Cancel dig on player change. This does work when returning to lobby, but not when hard disconnecting.
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);
["playerInventoryChanged", {_this call FUNC(handlePlayerInventoryChanged)}] call EFUNC(common,addEventhandler);
["playerVehicleChanged", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);

// handle waking up dragged unit and falling unconscious while dragging
["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call EFUNC(common,addEventhandler);

//@todo Captivity?
