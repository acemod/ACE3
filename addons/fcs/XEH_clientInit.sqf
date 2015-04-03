#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(time) = 0;
GVAR(position) = [0,0,0];

#include "initKeybinds.sqf"

["infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713151)) then {
        uiNamespace setVariable ["ACE_dlgRangefinder", _this select 0];
        ((_this select 0) displayCtrl 151) ctrlSetTextColor [0,0,0,0];
    };
}] call EFUNC(common,addEventHandler);
