/*
 * Author: Jonpas
 * Sets basic visible elements of the UI using showHUD setter.
 *
 * Arguments:
 * 0: Show Hint <BOOL> (default: false)
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

params [["_showHint", false]];

if (isArray (missionConfigFile >> "showHUD")) exitWith {
    if (_showHint) then {
        [LSTRING(Disabled)] call EFUNC(common,displayTextStructured);
    };
};

["ui", [
    true,
    GVAR(soldierVehicleWeaponInfo),
    GVAR(vehicleRadar),
    GVAR(vehicleCompass),
    true,
    GVAR(commandMenu),
    GVAR(groupBar),
    true
]] call EFUNC(common,showHud);
