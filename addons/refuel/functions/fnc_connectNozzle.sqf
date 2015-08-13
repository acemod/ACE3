/*
 * Author: GitHawk et.al.
 * Connect a fuel nozzle
 * With code from ace_attach
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 * 2: The nozzle <OBJECT> (optional)
 *
 * Return Value:
 * NIL
 *
 * Example:
 * [unit, target, nozzle] call ace_refuel_fnc_connectNozzle
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1

private ["_nozzle", "_actionID"];
params ["_unit", "_target"];

_nozzle = _unit getVariable [QGVAR(nozzle), nil];
if (isNil "_nozzle") exitWith {};

GVAR(placeAction) = PLACE_WAITING;

[{[localize LSTRING(Connect_Action), ""] call EFUNC(interaction,showMouseHint)}, []] call EFUNC(common,execNextFrame);
_unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE;}] call EFUNC(common,AddActionEventHandler)];

_actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize LSTRING(Cancel)], {GVAR(placeAction) = PLACE_CANCEL;}];

[{ 
    private["_virtualPos", "_virtualPosASL", "_lineInterection"];
    params ["_args","_pfID"];
    EXPLODE_4_PVT(_args,_unit,_target,_nozzle,_actionID);
    
    _virtualPosASL = (eyePos _unit) vectorAdd (positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]);
    if (cameraView == "EXTERNAL") then {
        _virtualPosASL = _virtualPosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
    };
    _virtualPos = _virtualPosASL call EFUNC(common,ASLToPosition);
    _lineInterection = lineIntersects [eyePos ace_player, _virtualPosASL, ace_player];
    
    //Don't allow placing in a bad position:
    if (_lineInterection && {GVAR(placeAction) == PLACE_APPROVE}) then {GVAR(placeAction) = PLACE_WAITING;};
        
    if ((GVAR(placeAction) != PLACE_WAITING) ||
            {_unit != ace_player} ||
            {!([_unit, _target, []] call EFUNC(common,canInteractWith))}) then {

        [_pfID] call CBA_fnc_removePerFrameHandler;
        [] call EFUNC(interaction,hideMouseHint);
        [_unit, "DefaultAction", (_unit getVariable [QGVAR(placeActionEH), -1])] call EFUNC(common,removeActionEventHandler);
        _unit removeAction _actionID;
        
        if (GVAR(placeAction) == PLACE_APPROVE) then {
            [_unit, _target, _virtualPos, _nozzle] call FUNC(ConnectNozzleAction);
        };
    }; // TODO add model like in attach/functions/fnc_attach
}, 0, [_unit, _target, _nozzle, _actionID] ] call cba_fnc_addPerFrameHandler;