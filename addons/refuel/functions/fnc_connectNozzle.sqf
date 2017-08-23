/*
 * Author: GitHawk et.al.
 * Connect a fuel nozzle.
 * With code from ace_attach
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, tank] call ace_refuel_fnc_connectNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
if (isNull _nozzle) exitWith {};

GVAR(placeAction) = PLACE_WAITING;

[{[localize LSTRING(Connect_Action), ""] call EFUNC(interaction,showMouseHint)}, []] call CBA_fnc_execNextFrame;
_unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE;}] call EFUNC(common,AddActionEventHandler)];

private _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize LSTRING(Cancel)], {GVAR(placeAction) = PLACE_CANCEL;}];

[{
    params ["_args","_pfID"];
    _args params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_actionID", -1, [0]]];

    private _virtualPosASL = (eyePos _unit) vectorAdd (positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]);
    if (cameraView == "EXTERNAL") then {
        _virtualPosASL = _virtualPosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
    };
    private _lineInterection = lineIntersects [eyePos ace_player, _virtualPosASL, ace_player];

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
            [_unit, _target, _virtualPosASL, _nozzle] call FUNC(ConnectNozzleAction);
        };
    }; // TODO add model like in attach/functions/fnc_attach
}, 0, [_unit, _target, _nozzle, _actionID] ] call cba_fnc_addPerFrameHandler;
