#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(ACE_time) = 0;
GVAR(position) = [0,0,0];

if (!hasInterface) exitWith {};

#include "initKeybinds.sqf"

["infoDisplayChanged", {
    params ["_display"];
    if (!isNull (_display displayCtrl 1713151)) then {
        uiNamespace setVariable ["ACE_dlgRangefinder", _display];
        (_display displayCtrl 151) ctrlSetTextColor [0,0,0,0];
    };
}] call EFUNC(common,addEventHandler);

// Register event for global updates
[QGVAR(forceUpdate), FUNC(onForceUpdate)] call EFUNC(common,addEventHandler);
