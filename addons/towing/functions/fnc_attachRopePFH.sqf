#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * PFH which allows the user to attach a rope to the given target vehicle
 *
 * Arguments:
 * 0: Unit wanting to attach rope <OBJECT>
 * 1: Vehicle to attach rope <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_towing_fnc_attachRopePFH
 *
 * Public: No
 */
params ["_unit", "_target", "_ignoreParent", "_ignoreRope", "_source", "_maxRange"];

private _viewDirection = getCameraViewDirection _unit;
GVAR(attachHelper) setPosASL (_unit modelToWorldVisualWorld [0, 1, 1.5]);

private _hintLMB = "";
private _hintRMB = localize ELSTRING(dragging,Drop);

private _startPos = eyePos _unit;
private _endPos = _startPos vectorAdd (_viewDirection vectorMultiply TOW_ACTION_DISTANCE);
private _intersections = lineIntersectsSurfaces [_startPos, _endPos, _unit, GVAR(attachHelper), true, 2];
GVAR(canAttach) = false;
if (_intersections isNotEqualTo []) then {
    private _intersectionToUse = [];
    {
        _x params ["", "", "_object"];
        if (_object isKindOf "AllVehicles" && { _object isNotEqualTo _ignoreRope && { _object isNotEqualTo _ignoreParent } }) exitWith {
            _intersectionToUse = _x;
        };
    } forEach _intersections;

    if (_intersectionToUse isEqualTo []) exitWith {};

    _intersectionToUse params ["_intersectPosition", "", "_intersectObject"];

    // if we have a target object, we assume we are attaching to the parent. If no target object, we are attaching to child
    GVAR(canAttach) = (_intersectObject isNotEqualTo _ignoreParent) && { (!isNull _target && { _intersectObject isEqualTo _target }) || { isNull _target && { [_intersectObject] call FUNC(isSuitableSimulation) }}} && { !(_intersectObject getVariable [QGVAR(towing), false]) };

    if (GVAR(canAttach)) then {
        TRACE_4("can attach",_target,_intersectObject,_ignoreParent,_ignoreRope);
        GVAR(attachHelper) setPosASL _intersectPosition;
        _hintLMB = localize LSTRING(attach);

        GVAR(attachHelper) setVariable [QGVAR(object), _intersectObject];
    };
    
};

if (_source isNotEqualTo [0, 0, 0]) then {
    private _distanceFromSource = _source vectorDistance getPosASLVisual GVAR(attachHelper);
    if (_distanceFromSource > _maxRange) then {
        GVAR(canAttach) = false;

        private _direction = _source vectorFromTo getPosASLVisual GVAR(attachHelper);
        GVAR(attachHelper) setPosASL (_source vectorAdd (_direction vectorMultiply _maxRange));

        _hintLMB = "";

        if (_distanceFromSource > _maxRange + 2) then {
            GVAR(cancel) = true;
        } else {
            GVAR(cancel) = false;
        };
    };
};

private _hint = [_hintLMB, _hintRMB];
if (_hint isNotEqualTo (_unit getVariable [QGVAR(hint), []])) then {
    _unit setVariable [QGVAR(hint), _hint];
    _hint call EFUNC(interaction,showMouseHint);
};

