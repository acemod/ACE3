#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(ladder) = objNull;
GVAR(cancelTime) = 0;
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

/*["ace_interactMenuOpened", {
    if ((CBA_missionTime > GVAR(cancelTime)) && !isNull GVAR(ladder)) then {
        GVAR(ladder) call FUNC(cancelTLdeploy);
    };
}] call CBA_fnc_addEventHandler;*/

// Cancel adjustment if interact menu opens
["ace_interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel adjusting on player change.
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;

// handle falling unconscious
["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

// @todo captivity?
