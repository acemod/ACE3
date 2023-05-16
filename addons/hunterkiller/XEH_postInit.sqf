#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[QGVAR(slew), LINKFUNC(slew)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(mode) = 0;
GVAR(targetTurret) = [];

["CBA_settingsInitialized", {
    ["turret", LINKFUNC(turretChangedEH), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;


["ACE3 Vehicles", QGVAR(observe), [format ["%1 - %2", LLSTRING(displayName), LLSTRING(observe)], LLSTRING(observe_description)],
{
    [false] call FUNC(keyDown)
}, {
    false
}, [DIK_Q, [false, false, false]]] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(override), [format ["%1 - %2", LLSTRING(displayName), LLSTRING(override)], LLSTRING(override_description)],
{
    [true] call FUNC(keyDown)
}, {
    false
}, [DIK_E, [false, false, false]]] call CBA_fnc_addKeybind;
