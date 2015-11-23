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
private ["_center","_radius","_scaled","_drawVehicles","_leader","_color","_cachedVehicles","_unit","_icon","_txt"];

if (GVAR(camMode) == 0) then {
    _map drawIcon ["\A3\UI_F\Data\GUI\Rsc\RscDisplayMissionEditor\iconcamera_ca.paa",[0,0,0,1],GVAR(freeCamera),20,20,GVAR(camPan)];
};

_center = _map ctrlMapScreenToWorld [0.5,0.5];
_radius = (_map ctrlMapScreenToWorld [safeZoneX,safeZoneY]) distance2D _center;
_scaled = (ctrlMapScale _map) > 0.2;

// Draw only group icons when scaled out
_drawVehicles = [];
{
    _leader = leader _x;
    if (_scaled) then {
        _color = GETVAR(_x,GVAR(gColor),[ARR_4(0,0,0,0)]);
        _map drawIcon ["\A3\ui_f\data\map\markers\nato\b_inf.paa", _color, _leader, 20, 20, 0, "", 0, 0];
    } else {
        if ((_leader distance2D _center) < _radius) then {
            _drawVehicles append (units _x);
        };
    };
    nil
} count GVAR(groupList);

// Draw units when group leader is within screen bounds
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

        _map drawIcon [_icon, _color, _unit, 19, 19, getDir _unit, _txt, 1, 0.04];
    };
    nil
} count (_drawVehicles arrayIntersect GVAR(unitList));
