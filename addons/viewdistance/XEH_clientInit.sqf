#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    // if not enabled, then bugger off.
    if !(GVAR(enabled)) exitWith {};

    // Limit on load
    [false] call FUNC(adaptViewDistance);

    // Set the EH which waits for a vehicle change to automatically swap between On Foot/In Land Vehicle/In Air Vehicle
    // Also run when SettingsInitialized runs (not guaranteed)
    ["vehicle",{
        [false] call FUNC(adaptViewDistance);
    }] call CBA_fnc_addPlayerEventHandler;
    ["ACE_controlledUAV", {
        [false] call FUNC(adaptViewDistance);
    }] call CBA_fnc_addEventHandler;

}] call CBA_fnc_addEventHandler;
