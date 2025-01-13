#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    TRACE_1("SettingInit",XGVAR(enable));

    // If not enabled, then do not add CanInteractWith Condition or event handlers
    if (!XGVAR(enable)) exitWith {};

    // Initialize all seats
    {
        _x call FUNC(addSitActions);
    } forEach keys (uiNamespace getVariable [QGVAR(seats), []]);

    // Add interaction menu exception
    ["isNotSitting", {isNil {(_this select 0) getVariable QGVAR(sittingStatus)}}] call EFUNC(common,addCanInteractWithCondition);

    // Handle interruptions
    ["ace_unconscious", LINKFUNC(handleInterrupt)] call CBA_fnc_addEventHandler;
    ["ace_captives_SetHandcuffed", LINKFUNC(handleInterrupt)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
