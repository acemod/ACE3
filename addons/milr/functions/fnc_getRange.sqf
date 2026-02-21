#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets the range to the target the player's weapon is aiming at
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_milr_fnc_getRange
 *
 * Public: No
 */
params ["_player"];
private _posHandRel = _player selectionPosition "head";
// for some fancy stuff see https://community.bistudio.com/wiki/selectionVectorDirAndUp
private _posHandASL = _player modelToWorldVisualWorld _posHandRel;
private _dir = _player weaponDirection currentWeapon _player;
private _posEndASL = _posHandASL vectorAdd (_dir vectorMultiply RANGEFINDER_MAX_RANGE);

private _vehicle = vehicle _player;
private _intersects = lineIntersectsSurfaces [_posHandASL, _posEndASL, _player, _vehicle];

if (_intersects isEqualTo []) exitWith { RANGE_NO_RETURNS };
(_intersects select 0) params ["_intersectPosASL"];
private _distance = _posHandASL distance _intersectPosASL;
if (_distance < RANGEFINDER_MIN_RANGE) exitWith { RANGE_TOO_CLOSE };
_distance
