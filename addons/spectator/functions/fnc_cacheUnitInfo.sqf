/*
 * Author: SilentSpike
 * Caches the units information for quick retrevial in spectator interface PFHs
 *
 * Arguments:
 * 0: Unit to have info cached for <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [vehicle player] call ace_spectator_fnc_cacheUnitInfo
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];
private ["_color","_icon","_name"];

// Group info only needs to be cached once (groups can't change)
if (isNil { GETVAR((group _unit),GVAR(gColor),nil) }) then {
    _color = [side group _unit] call BIS_fnc_sideColor;
    SETVAR((group _unit),GVAR(gColor),_color);
};

// Unit info should be updated each time
_icon = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "Icon");
_name = [_unit,false] call EFUNC(common,getName);

// Handle CfgVehicleIcons
if (isText (configFile >> "CfgVehicleIcons" >> _icon)) then {
    _icon = getText (configFile >> "CfgVehicleIcons" >> _icon);
};

SETVAR(_unit,GVAR(uIcon),_icon);
SETVAR(_unit,GVAR(uName),_name);
