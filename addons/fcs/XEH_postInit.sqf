#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(time) = 0;
GVAR(position) = [0,0,0];

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

["ace_infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713151)) then {
        uiNamespace setVariable ["ACE_dlgRangefinder", _this select 0];
        ((_this select 0) displayCtrl 151) ctrlSetTextColor [0,0,0,0];
    };
}] call CBA_fnc_addEventHandler;

// Register event for global updates
[QGVAR(forceUpdate), {[ACE_player] call FUNC(onForceUpdate)}] call CBA_fnc_addEventHandler;

[QGVAR(addFiredEH), {
    TRACE_1("Adding firedEH",_this);
    ["ace_firedPlayerVehicle", LINKFUNC(firedEH)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicleNonLocal", LINKFUNC(firedEH)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
call compile preprocessFileLineNumbers QPATHTOF(dev\test_debugConfigs.sqf);
#endif
