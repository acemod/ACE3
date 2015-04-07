#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(time) = 0;
GVAR(position) = [0,0,0];

#include "initKeybinds.sqf"

<<<<<<< HEAD
["infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713151)) then {
        uiNamespace setVariable ["ACE_dlgRangefinder", _this select 0];
        ((_this select 0) displayCtrl 151) ctrlSetTextColor [0,0,0,0];
    };
}] call EFUNC(common,addEventHandler);
=======
// Register event for global updates
[QGVAR(forceUpdate), FUNC(onForceUpdate)] call ace_common_fnc_addEventHandler;
>>>>>>> d1b8595c0ed938a88bbf21405ce0319f3456da24
