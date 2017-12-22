/*
 * Author: Glowbal
 * Replace a (dead) body by a body bag
 *
 * Arguments:
 * 0: The actor <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * body bag (will return objNull when run where target is not local) <OBJECT>
 *
 * Example:
 * [player, cursorTarget] call ace_medical_fnc_actionPlaceInBodyBag
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target"];
TRACE_2("params",_caller,_target);

if (!local _target) exitWith {
    TRACE_1("running where local",local _target);
    [QGVAR(actionPlaceInBodyBag), [_caller, _target], [_target]] call CBA_fnc_targetEvent;
    objNull
};

if (alive _target) then {
    TRACE_1("manually killing with setDead",_target);
    [_target, true] call FUNC(setDead);
};

private _position = (getPosASL _target) vectorAdd [0, 0, 0.2];

private _headPos  = _target modelToWorldVisual (_target selectionPosition "head");
private _spinePos = _target modelToWorldVisual (_target selectionPosition "Spine3");
private _dirVect = _headPos vectorFromTo _spinePos;
private _direction = _dirVect call CBA_fnc_vectDir;

//move the body away now, so it won't physX the bodyBag object (this setPos seems to need to be called where object is local)
_target setPosASL [-5000, -5000, 0];

private _bodyBag = createVehicle ["ACE_bodyBagObject", _position, [], 0, "NONE"];

// prevent body bag from flipping
_bodyBag setPosASL _position;
_bodyBag setDir _direction;

["ace_placedInBodyBag", [_target, _bodyBag]] call CBA_fnc_globalEvent; //hide and delete body on server

_bodyBag
