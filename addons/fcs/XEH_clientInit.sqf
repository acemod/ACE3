#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(time) = 0;
GVAR(position) = [0,0,0];

#include "initKeybinds.sqf"

["infoDisplayChanged", {
    private "_control";
    _control = (_this select 0) displayCtrl 151;

    if (!isNull _control && {_this select 1 == "Any"}) then {
        uiNamespace setVariable ['ACE_dlgRangefinder', _this select 0];
        _control ctrlSetTextColor [0, 0, 0, 0];
    };
}] call EFUNC(common,addEventHandler);
