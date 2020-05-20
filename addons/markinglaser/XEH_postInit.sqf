#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

// Events
[QGVAR(laserOn),  FUNC(onLaserOn)]  call CBA_fnc_addEventHandler;
[QGVAR(laserOff), FUNC(onLaserOff)] call CBA_fnc_addEventHandler;

// Keybinds
["ACE3 Vehicles", QGVAR(toggleLaser), localize LSTRING(ToggleLaser), {
    private _vehicle = vehicle ACE_Player;

    if (_vehicle isKindOf "Air" && {hasPilotCamera _vehicle}) then {
        if (_vehicle getVariable [QGVAR(laserOn), false]) then {
            [QGVAR(laserOff), [_vehicle]] call CBA_fnc_globalEvent;
        } else {
            [QGVAR(laserOn), [_vehicle]] call CBA_fnc_globalEvent;
        };

        true
    } else {
        false
    };
}, "", [DIK_L, [false, false, true]]] call CBA_fnc_addKeybind;

// JIP init
if (didJIP) then {
    {
        if (_x getVariable [QGVAR(laserOn), false]) then {
            [_x] call FUNC(onLaserOn);
        };
    } forEach (allMissionObjects "Air");
};
