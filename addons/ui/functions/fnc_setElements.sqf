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
 * call ace_ui_fnc_setBasicElements
 *
 * Public: No
 */
#include "script_component.hpp"

//@todo - change to EFUNC(common,showHud) setter

local _shownHUD = shownHUD; // [hud, info, radar, compass, direction, menu, group, cursors]

showHUD [
    _shownHUD select 0,
    GVAR(soldierVehicleWeaponInfo),
    GVAR(vehicleRadar),
    GVAR(vehicleCompass),
    _shownHUD select 4,
    GVAR(commandMenu),
    GVAR(groupBar),
    _shownHUD select 7
];

/*
["UIselective", [
    _shownHUD select 0,
    _shownHUD select 1,
    _shownHUD select 2,
    _shownHUD select 3,
    _shownHUD select 4,
    GVAR(commandMenu),
    _shownHUD select 6,
    _shownHUD select 7
]] call EFUNC(common,showHud);
*/
