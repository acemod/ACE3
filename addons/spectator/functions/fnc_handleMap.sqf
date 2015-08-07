/*
 * Author: Head, SilentSpike
 * Handles rendering the spectator map icons
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleIcons, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_map"];
private ["_cachedVehicles","_unit","_color","_icon","_txt"];

if (GVAR(camMode) == 0) then {
    _map drawIcon ["\A3\UI_F\Data\GUI\Rsc\RscDisplayMissionEditor\iconcamera_ca.paa",[0,0,0,1],GVAR(camera),20,20,GVAR(camPan)];
};

_cachedVehicles = [];
{
    _unit = vehicle _x;

    if !(_unit in _cachedVehicles) then {
        _cachedVehicles pushBack _unit;

        // Use previously cached info where possible
        if (GETVAR(_unit,GVAR(uIcon),"") == "") then {
            [_unit] call FUNC(cacheUnitInfo);
        };

        // Function has caching built in
        _color = [side effectiveCommander _unit] call BIS_fnc_sideColor;
        _icon = GETVAR(_unit,GVAR(uIcon),"");
        _txt = ["", GETVAR(_x,GVAR(uName),"")] select (isPlayer _x);

        _map drawIcon [_icon, _color, _unit, 19, 19, getDir _unit, _txt, 1, 0.03];
    };
    false
} count GVAR(unitList);
