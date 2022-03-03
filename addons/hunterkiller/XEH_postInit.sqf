#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if ((productVersion # 2) < 208) exitWith {};

[QGVAR(slew), LINKFUNC(slew)] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(isMaster) = false;
["CBA_settingsInitialized", {
    ["turret", LINKFUNC(turretChangedEH), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;

["ACE3 Vehicles", QGVAR(commanderOverride), [LLSTRING(commanderOverride), LLSTRING(commanderOverride_description)],
{
    [true] call FUNC(keyDown)
}, {
    false
}, [DIK_Q, [false, false, false]]] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(commanderObserve), [LLSTRING(commanderOverride), LLSTRING(commanderOverride_description)],
{
    [false] call FUNC(keyDown)
}, {
    false
}, [DIK_E, [false, false, false]]] call CBA_fnc_addKeybind;
