#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(time) = 0;
GVAR(position) = [0,0,0];

if (!hasInterface) exitWith {};

#include "initKeybinds.sqf"

["infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713151)) then {
        uiNamespace setVariable ["ACE_dlgRangefinder", _this select 0];
        ((_this select 0) displayCtrl 151) ctrlSetTextColor [0,0,0,0];
    };
}] call EFUNC(common,addEventHandler);

// Register event for global updates
[QGVAR(forceUpdate), FUNC(onForceUpdate)] call EFUNC(common,addEventHandler);
