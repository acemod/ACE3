#include "script_component.hpp"

if (isServer) then {
    // Cancel deploy on hard disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
};

if (!hasInterface) exitWith {};

GVAR(placer) = objNull;
GVAR(sandBag) = objNull;
GVAR(deployPFH) = -1;
GVAR(deployDirection) = 0;

[{_this call FUNC(handleScrollWheel)}] call EFUNC(common,addScrollWheelEventHandler);

// Cancel deploy sandbag if interact menu opened
["interactMenuOpened", {
    if (GVAR(deployPFH) != -1) then {
        call FUNC(deployCancel);
    };
}] call EFUNC(common,addEventHandler);

// Cancel deploy on player change. This does work when returning to lobby, but not when hard disconnecting.
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);
["playerInventoryChanged", {_this call FUNC(handlePlayerInventoryChanged)}] call EFUNC(common,addEventhandler);
["playerVehicleChanged", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);

// handle waking up dragged unit and falling unconscious while dragging
["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call EFUNC(common,addEventhandler);

//@todo Captivity?
