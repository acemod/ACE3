/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support, esteldunedain
 * Starts the place process for trench.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: Trench type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_placeTrench
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_trenchTypeName"];

GVAR(trenchType) = missionNamespace getVariable _trenchTypeName;

TRACE_2("",_trenchTypeName,GVAR(trenchType));
// prevent the placing unit from running
[_unit, "forceWalk", "ACE_Trenches", true] call EFUNC(common,statusEffect_set);

// create the trench
private "_trench";
_trench = createVehicle [GVAR(trenchType) select 1, [0, 0, 0], [], 0, "NONE"];

GVAR(trench) = _trench;

// prevent collisions with trench
["enableSimulationGlobal", [_trench, false]] call EFUNC(common,serverEvent);

GVAR(digDirection) = 0;

// pfh that runs while the dig is in progress
GVAR(digPFH) = [{
    (_this select 0) params ["_unit", "_trench"];

    if (isNull _trench) exitWith {
        [_unit] call FUNC(digCancel);
    };

    private _basePos = eyePos _unit vectorAdd (positionCameraToWorld [0, 0, 2] vectorDiff positionCameraToWorld [0, 0, 0]);
    private _angle = (GVAR(digDirection) + getDir _unit);

    // Stick the trench to the ground
    GVAR(trenchType) params ["", "", "_dx", "_dy", "_offset"];
    private _minz = (getTerrainHeightASL _basePos);
    private ["_ix","_iy"];
    for [{_ix = -_dx/2},{_ix <= _dx/2},{_ix = _ix + _dx/3}] do {
        for [{_iy = -_dy/2},{_iy <= _dy/2},{_iy = _iy + _dy/3}] do {
            private _pos = _basePos vectorAdd ([cos _angle, -sin _angle, 0] vectorMultiply _ix)
                                    vectorAdd ([sin _angle, +cos _angle, 0] vectorMultiply _iy);
            _minz = _minz min (getTerrainHeightASL _pos);

            #ifdef DEBUG_MODE_FULL
                _pos set [2, getTerrainHeightASL _pos];
                _pos2 = +_pos;
                _pos2 set [2, getTerrainHeightASL _pos+2];
                drawLine3D [ASLtoAGL _pos, ASLtoAGL _pos2, [1,1,0,1]];
            #endif
        };
    };
    _basePos set [2, _minz + _offset];

    _trench setPosASL _basePos;
    _trench setDir _angle;
}, 0, [_unit, _trench]] call CBA_fnc_addPerFrameHandler;

// add mouse button action and hint
[localize LSTRING(ConfirmDig), localize LSTRING(CancelDig), localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(Dig), [
    _unit, "DefaultAction",
    {GVAR(digPFH) != -1},
    {[_this select 0] call FUNC(digConfirm)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(Cancel), [
    _unit, "zoomtemp",
    {GVAR(digPFH) != -1},
    {[_this select 0] call FUNC(digCancel)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(isDigging), true, true];
