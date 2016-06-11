/*
 * Author: GitHawk
 * Handles connecting a tilt cable to a vehicle using attach system.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, player] call ace_tilting_fnc_connectCable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

GVAR(placeAction) = PLACE_WAITING;

[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

[
    localize LSTRING(ConnectCable),
    ["", localize ELSTRING(common,Cancel)] select (_unit getVariable [QGVAR(tiltingStage), 0] == 0)
] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(placeActionEH), [_unit, "DefaultAction", {true}, {GVAR(placeAction) = PLACE_APPROVE}] call EFUNC(common,addActionEventHandler)];
private _actionID = _unit addAction [
    format ["<t color='#FF0000'>%1</t>", localize ELSTRING(common,Cancel)],
    {[_this select 1] call FUNC(cancelConnect)}
];

GVAR(pfhRunning) = true;

[{
    params ["_args", "_pfID"];
    _args params ["_unit", "_attachToVehicle", "_actionID"];

    private _virtualPosASL = (eyePos _unit) vectorAdd (positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]);
    if (cameraView == "EXTERNAL") then {
        _virtualPosASL = _virtualPosASL vectorAdd ((positionCameraToWorld [0.3,0,0]) vectorDiff (positionCameraToWorld [0,0,0]));
    };
    private _virtualPos = _virtualPosASL call EFUNC(common,ASLToPosition);
    private _lineInterection = lineIntersects [eyePos ACE_player, _virtualPosASL, ACE_player];

    // Don't allow placing in a bad position:
    if (_lineInterection && {GVAR(placeAction) == PLACE_APPROVE}) then {GVAR(placeAction) = PLACE_WAITING;};

    if ((GVAR(placeAction) != PLACE_WAITING) || {_unit != ACE_player} || {!([_unit, _attachToVehicle, []] call EFUNC(common,canInteractWith))}) then {

        [_pfID] call CBA_fnc_removePerFrameHandler;
        GVAR(pfhRunning) = false;
        call EFUNC(interaction,hideMouseHint);

        [_unit, "DefaultAction", (_unit getVariable [QGVAR(placeActionEH), -1])] call EFUNC(common,removeActionEventHandler);
        _unit removeAction _actionID;

        if (GVAR(placeAction) == PLACE_APPROVE) then {
            [_unit, _attachToVehicle, _virtualPos] call FUNC(attachCable);
        };
    };
}, 0, [_unit, _target, _actionID] ] call CBA_fnc_addPerFrameHandler;
