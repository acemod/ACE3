#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(adjustPFH) = -1;

GVAR(height) = 0;

// Cancel adjustment if interact menu opens
["interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CFUNC(addEventHandler);

// Cancel adjusting on player change.
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CFUNC(addEventhandler);
["playerVehicleChanged", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CFUNC(addEventhandler);

// handle falling unconscious
["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call CFUNC(addEventhandler);

// @todo captivity?
