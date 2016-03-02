/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support and esteldunedain
 * Confirms trench dig
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_placeConfirm
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// enable running again
[_unit, "forceWalk", "ACE_Trenches", false] call EFUNC(common,statusEffect_set);

// remove dig pfh
[GVAR(digPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(digPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Dig), -1]] call EFUNC(common,removeActionEventHandler);
[_unit, "zoomtemp",      _unit getVariable [QGVAR(Cancel), -1]] call EFUNC(common,removeActionEventHandler);

_unit setVariable [QGVAR(isPlacing), false, true];

// Delete placement dummy and create real trench
params ["_unit"];
if (isNull GVAR(trench)) exitWith {};

deleteVehicle GVAR(trench);
private _trench = createVehicle [GVAR(trenchType) select 0, [0, 0, 0], [], 0, "NONE"];

GVAR(trenchType) params ["", "", "_dx", "_dy", "_offset"];
private _basePos = GVAR(trenchPos);
private _angle = (GVAR(digDirection) + getDir _unit);

// _v1 forward from the player, _v2 to the right, _v3 points away from the ground
private _v3 = surfaceNormal _basePos;
private _v2 = [sin _angle, +cos _angle, 0] vectorCrossProduct _v3;
private _v1 = _v3 vectorCrossProduct _v2;

// Stick the trench to the ground
_basePos set [2, getTerrainHeightASL _basePos];
private _minzoffset = 0;
private ["_ix","_iy"];
for [{_ix = -_dx/2},{_ix <= _dx/2},{_ix = _ix + _dx/3}] do {
    for [{_iy = -_dy/2},{_iy <= _dy/2},{_iy = _iy + _dy/3}] do {
        private _pos = _basePos vectorAdd (_v2 vectorMultiply _ix)
                                vectorAdd (_v1 vectorMultiply _iy);
        _minzoffset = _minzoffset min ((getTerrainHeightASL _pos) - (_pos select 2));
        #ifdef DEBUG_MODE_FULL
            _pos set [2, getTerrainHeightASL _pos];
            _pos2 = +_pos;
            _pos2 set [2, getTerrainHeightASL _pos + 1];
            drawLine3D [ASLtoAGL _pos, ASLtoAGL _pos2, [1,1,0,1]];
        #endif
    };
};
_basePos set [2, (_basePos select 2) + _minzoffset + _offset];
private _vecDirAndUp = [_v1, _v3];

GVAR(trench) = objNull;

// Mark the unit as digging
private _trenchId = GVAR(trenchId);
_unit setVariable [QGVAR(isDiggingId), _trenchId, true];
GVAR(trenchId) = GVAR(trenchId) + 1;

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit"];
    _unit setVariable [QGVAR(isDiggingId), -1, true];
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit"];
    _unit setVariable [QGVAR(isDiggingId), -1, true];
};
[12.5, [_unit], _fnc_onFinish, _fnc_onFailure, localize LSTRING(DiggingTrench)] call EFUNC(common,progressBar);

// Schedule progressive raising of the trench
private _fnc_setPlacing = {
    params ["_unit", "_trench", "_trenchId", "_pos", "_vecDirAndUp"];

    // If the progress bar was cancelled, cancel elevation
    // We use an uid to avoid any chance of an older trench being raised when a new one is built
    if (_unit getVariable [QGVAR(isDiggingId), -1] != _trenchId) exitWith {};

    _trench setPosASL _pos;
    _trench setVectorDirAndUp _vecDirAndUp;
};

// For loops are for wimps
[_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 1.0], _vecDirAndUp] call _fnc_setPlacing;
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.9], _vecDirAndUp], 3.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.8], _vecDirAndUp], 4.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.7], _vecDirAndUp], 5.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.6], _vecDirAndUp], 6.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.5], _vecDirAndUp], 7.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.4], _vecDirAndUp], 8.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.3], _vecDirAndUp], 9.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.2], _vecDirAndUp],10.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.1], _vecDirAndUp],11.0] call EFUNC(common,waitAndExecute);
[_fnc_setPlacing, [_unit, _trench, _trenchId, _basePos vectorDiff [0, 0, 0.0], _vecDirAndUp],12.0] call EFUNC(common,waitAndExecute);

// Play animation
[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
