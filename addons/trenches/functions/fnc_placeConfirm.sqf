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
[_unit, "blockThrow", "ACE_Trenches", false] call EFUNC(common,statusEffect_set);

// remove dig pfh
[GVAR(digPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(digPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Dig), -1]] call EFUNC(common,removeActionEventHandler);

_unit setVariable [QGVAR(isPlacing), false, true];

// Delete placement dummy and create real trench
params ["_unit"];
if (isNull GVAR(trench)) exitWith {};

deleteVehicle GVAR(trench);
private _trench = createVehicle [GVAR(trenchClass), [0, 0, 0], [], 0, "NONE"];

GVAR(trenchPlacementData) params ["_dx", "_dy", "_offset"];
private _basePos = GVAR(trenchPos);
private _angle = (GVAR(digDirection) + getDir _unit);

// _v1 forward from the player, _v2 to the right, _v3 points away from the ground
private _v3 = surfaceNormal _basePos;
private _v2 = [sin _angle, +cos _angle, 0] vectorCrossProduct _v3;
private _v1 = _v3 vectorCrossProduct _v2;

// Stick the trench to the ground
_basePos set [2, getTerrainHeightASL _basePos];
private _minzoffset = 0;

for [{private _ix = -_dx/2},{_ix <= _dx/2},{_ix = _ix + _dx/3}] do {
    for [{private _iy = -_dy/2},{_iy <= _dy/2},{_iy = _iy + _dy/3}] do {
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

_trench setVariable [QGVAR(placeData), [_basePos, _vecDirAndUp], true];

[_trench, _unit] call FUNC(continueDiggingTrench);
