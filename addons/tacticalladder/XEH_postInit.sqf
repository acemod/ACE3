#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(ladder) = objNull;
GVAR(cancelTime) = 0;
GVAR(currentStep) = 3;
GVAR(currentAngle) = 0;

/*["interactMenuOpened", {
    if ((ACE_time > GVAR(cancelTime)) && !isNull GVAR(ladder)) then {
        GVAR(ladder) call FUNC(cancelTLdeploy);
    };
}] call CBA_fnc_addEventHandler;*/

// Cancel adjustment if interact menu opens
["interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel adjusting on player change.
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;
["playerVehicleChanged", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addEventHandler;

// handle falling unconscious
["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

// @todo captivity?
