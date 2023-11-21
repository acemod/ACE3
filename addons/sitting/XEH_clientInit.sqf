#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    TRACE_1("SettingInit", XGVAR(enable));

    // If not enabled, then do not add CanInteractWith Condition or event handlers
    if (!XGVAR(enable)) exitWith {};

    // Initialize classes as they spawn
    ["ThingX", "init", FUNC(addSitActions), nil, nil, true] call CBA_fnc_addClassEventHandler;

    // Initialize statically defined benches (also appear as world objects, no class EH thrown)
    {
        [_x] call FUNC(addSitActions);
    } forEach [BENCHES];

    // Add interaction menu exception
    ["isNotSitting", {isNil {(_this select 0) getVariable QGVAR(sittingStatus)}}] call EFUNC(common,addCanInteractWithCondition);

    // Handle interruptions
    ["ace_unconscious", {_this call DFUNC(handleInterrupt)}] call CBA_fnc_addEventHandler;
    ["ace_captives_SetHandcuffed", {_this call DFUNC(handleInterrupt)}] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
