// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

["playerInventoryChanged", {
    params ["_unit"];
    [_unit] call FUNC(takeLoadedATWeapon);
    [_unit] call FUNC(updateInventoryDisplay);
}] call EFUNC(common,addEventHandler);

// Register fire event handler
// Only for the local player and for AI. Non-local players will handle it themselves
["firedPlayer", DFUNC(replaceATWeapon)] call EFUNC(common,addEventHandler);
["firedNonPlayer", DFUNC(replaceATWeapon)] call EFUNC(common,addEventHandler);
