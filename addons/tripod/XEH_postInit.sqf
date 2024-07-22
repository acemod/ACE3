#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(adjustPFH) = -1;

GVAR(height) = 0.5;

// Cancel adjustment if interact menu opens
["ace_interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel adjusting on player change.
["unit", LINKFUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;

// handle falling unconscious
["ace_unconscious", LINKFUNC(handleUnconscious)] call CBA_fnc_addEventHandler;

// @todo captivity?
