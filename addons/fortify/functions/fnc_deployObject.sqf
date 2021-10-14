#include "script_component.hpp"
/*
 * Author: Kingsley
 * Deploys the object to the player for them to move it around.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Object params (side, classname, rotations) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, [west, "Land_BagBunker_Small_F"]] call ace_fortify_fnc_deployObject
 *
 * Public: No
 */

params ["", "_player", "_params"];
_params params [["_side", sideUnknown, [sideUnknown]], ["_classname", "", [""]], ["_rotations", [0,0,0]]];
TRACE_4("deployObject",_player,_side,_classname,_rotations);

private _budget = [_side] call FUNC(getBudget);
private _cost = [_side, _classname] call FUNC(getCost);

// Create a local only copy of the object
private _object = _classname createVehicleLocal [0, 0, 0];
_object disableCollisionWith _player;

GVAR(objectRotationX) = _rotations select 0;
GVAR(objectRotationY) = _rotations select 1;
GVAR(objectRotationZ) = _rotations select 2;

GVAR(isPlacing) = PLACE_WAITING;

private _lmb = LLSTRING(confirm);
if (_budget > -1) then {_lmb = _lmb + format [" -$%1", _cost];};
private _rmb = localize ELSTRING(Common,Cancel);
private _wheel = LLSTRING(rotate);
private _xAxis = localize "str_disp_conf_xaxis";
private _icons = [["alt", localize "str_3den_display3den_entitymenu_movesurface_text"], ["shift", localize "str_disp_conf_xaxis" + " " + _wheel], ["control", localize "str_disp_conf_yaxis" + " " + _wheel]];
[_lmb, _rmb, _wheel, _icons] call EFUNC(interaction,showMouseHint);

private _mouseClickID = [_player, "DefaultAction", {GVAR(isPlacing) == PLACE_WAITING}, {GVAR(isPlacing) = PLACE_APPROVE}] call EFUNC(common,addActionEventHandler);
[QGVAR(onDeployStart), [_player, _object, _cost]] call CBA_fnc_localEvent;

[{
    params ["_args", "_pfID"];
    _args params ["_unit", "_object", "_cost", "_mouseClickID"];

    if (_unit != ACE_player || {isNull _object} || {!([_unit, _object, []] call EFUNC(common,canInteractWith))} || {!([_unit, _cost] call FUNC(canFortify))}) then {
        GVAR(isPlacing) = PLACE_CANCEL;
    };

    // If place approved, verify deploy handlers
    if (GVAR(isPlacing) == PLACE_APPROVE && {(GVAR(deployHandlers) findIf {([_unit, _object, _cost] call _x) isEqualTo false}) > -1}) then {
        GVAR(isPlacing) = PLACE_WAITING;
    };

    if (GVAR(isPlacing) != PLACE_WAITING) exitWith {
        TRACE_3("exiting PFEH",GVAR(isPlacing),_pfID,_mouseClickID);
        [_pfID] call CBA_fnc_removePerFrameHandler;
        call EFUNC(interaction,hideMouseHint);
        [_unit, "DefaultAction", _mouseClickID] call EFUNC(common,removeActionEventHandler);

        if (GVAR(isPlacing) == PLACE_APPROVE) then {
            TRACE_1("deploying object",_object);
            GVAR(isPlacing) = PLACE_CANCEL;
            [_unit, _object] call FUNC(deployConfirm);
        } else {
            TRACE_1("deleting object",_object);
            deleteVehicle _object;
        };
    };

    ([_object] call FUNC(axisLengths)) params ["_width", "_length", "_height"];
    private _distance = (_width max _length) + 0.5; // for saftey, move it a bit extra away from player's center

    private _start = eyePos _unit;
    private _camViewDir = getCameraViewDirection _unit;
    private _basePos = _start vectorAdd (_camViewDir vectorMultiply _distance);
    _basePos set [2, ((_basePos select 2) - (_height / 2)) max (getTerrainHeightASL _basePos - 0.05)];

    _object setPosASL _basePos;

    private _vZ =  180 + GVAR(objectRotationZ) + getDir _unit;
    if (cba_events_alt) then {
        // Snap to terrain surface dir
        _object setDir _vZ;
        _object setVectorUp (surfaceNormal _basePos);
    } else {
        [_object, GVAR(objectRotationX), GVAR(objectRotationY), _vZ] call EFUNC(common,setPitchBankYaw);
    };
    #ifdef DEBUG_MODE_FULL
    hintSilent format ["Rotation:\nX: %1\nY: %2\nZ: %3", GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)];
    #endif
}, 0, [_player, _object, _cost, _mouseClickID]] call CBA_fnc_addPerFrameHandler;
