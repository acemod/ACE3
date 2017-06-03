/*
 * Author: Head, SilentSpike
 * Handles rendering the spectator 3D unit icons
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

if !(GVAR(showIcons)) exitWith {};
private ["_refPoint","_drawVehicles","_leader","_color","_txt","_unit"];

// Draw groups unless leader is within distance
_refPoint = [GVAR(freeCamera),GVAR(camUnit)] select (GVAR(camMode) > 0);
_drawVehicles = [];
{
    _leader = leader _x;
    if ((_leader distanceSqr _refPoint) > 40000) then {
        _color = GETVAR(_x,GVAR(gColor),[ARR_4(0,0,0,0)]);
        _txt = groupID _x;

        drawIcon3D ["\A3\ui_f\data\map\markers\nato\b_inf.paa", _color, (_leader modelToWorldVisual (_leader selectionPosition "Head")) vectorAdd [0,0,28.5], 1, 1, 0, _txt, 2, 0.02];
    } else {
        _drawVehicles append (units _x);
    };
    false
} count GVAR(groupList);

// Draw units for groups within distance
{
    _color = GETVAR((group _x),GVAR(gColor),[ARR_4(0,0,0,0)]);
    _txt = ["", GETVAR(_x,GVAR(uName),"")] select (isPlayer _x);

    drawIcon3D ["a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa", _color, (_x modelToWorldVisual (_x selectionPosition "Head")) vectorAdd [0,0,1.5], 0.7, 0.7, 0, _txt, 1, 0.02];
    false
} count (_drawVehicles arrayIntersect GVAR(unitList));
