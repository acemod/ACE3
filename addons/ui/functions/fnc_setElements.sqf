/*
 * Author: Jonpas
 * Sets basic visible elements of the UI using showHUD setter.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_ui_fnc_setElements
 *
 * Public: No
 */
#include "script_component.hpp"

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
