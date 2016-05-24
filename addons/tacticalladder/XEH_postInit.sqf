#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(ladder) = objNull;
GVAR(cancelTime) = 0;
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

/*["ace_interactMenuOpened", {
    if ((ACE_time > GVAR(cancelTime)) && !isNull GVAR(ladder)) then {
        GVAR(ladder) call FUNC(cancelTLdeploy);
    };
}] call CBA_fnc_addEventHandler;*/

// Cancel adjustment if interact menu opens
["ace_interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel adjusting on player change.
["ace_playerChanged", {_this call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;
["ace_playerVehicleChanged", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;

// handle falling unconscious
["ace_medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

// @todo captivity?
