/*
 * Author: Glowbal
 * Replace a (dead) body by a body bag
 *
 * Arguments:
 * 0: The actor <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * body bag <OBJECT>
 *
 * Public: Yes
 */

#include "script_component.hpp"

PARAMS_2(_caller,_target);

private ["_position", "_headPos", "_spinePos", "_dirVect", "_direction", "_bodyBag"];

if (alive _target) then {
    [_target, true] call FUNC(setDead);
};

_position = (getPosASL _target) vectorAdd [0, 0, 0.2];

_headPos  = _target modelToWorldVisual (_target selectionPosition "head");
_spinePos = _target modelToWorldVisual (_target selectionPosition "Spine3");
_dirVect = _headPos vectorFromTo _spinePos;
_direction = _dirVect call CBA_fnc_vectDir;

deleteVehicle _target;

_bodyBag = createVehicle ["ACE_bodyBagObject", _position, [], 0, "CAN_COLLIDE"];

// prevent body bag from flipping
_bodyBag setPosASL _position;
_bodyBag setDir _direction;

_bodyBag
