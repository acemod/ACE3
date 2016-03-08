/*
 * Author: Jonpas
 * Sets basic visible elements of the UI using showHUD setter.
 *
 * Arguments:
 * 0: Force change even when disallowed <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_ui_fnc_setElements
 *
 * Public: No
 */
#include "script_component.hpp"

if (isArray (missionConfigFile >> "showHUD")) exitWith {};

params [ ["_force", false, [true]] ];

if (!_force && {!GVAR(allowSelectiveUI)}) exitWith {
    [LSTRING(Disallowed), 2] call EFUNC(common,displayTextStructured)
};

private _shownHUD = shownHUD; // [hud, info, radar, compass, direction, menu, group, cursors]

["ui", [
    _shownHUD select 0,
    GVAR(soldierVehicleWeaponInfo),
    GVAR(vehicleRadar),
    GVAR(vehicleCompass),
    _shownHUD select 4,
    GVAR(commandMenu),
    GVAR(groupBar),
    _shownHUD select 7
]] call EFUNC(common,showHud);
