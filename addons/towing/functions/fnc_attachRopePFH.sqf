#include "..\script_component.hpp"
/*
 * Author: tcvm
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
private _hintRMB = LELSTRING(common,Drop);

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

    GVAR(canAttach) =
        _intersectObject isNotEqualTo _ignoreParent
        && {
            // if we have a target object, we assume we are attaching to the parent. If no target object, we are attaching to child
            if (!isNull _target) then {
                _intersectObject isEqualTo _target
            } else {
                [_intersectObject] call FUNC(isSuitableSimulation)
                && { // ignore _intersectObject which has parent != _ignoreParent
                    private _intersectObjectParent = _intersectObject getVariable [QGVAR(parent), objNull];
                    isNull _intersectObjectParent || {_intersectObjectParent == _ignoreParent}
                } && { // arma prevents making rings (ropeAttachTo silently fails)
                    private _ancestor = _ignoreParent getVariable [QGVAR(parent), objNull];
                    while {!isNull _ancestor && {_ancestor != _intersectObject}} do {
                        _ancestor = _ancestor getVariable [QGVAR(parent), objNull];
                    };
                    isNull _ancestor
                }
            }
        }
    ;

    if (GVAR(canAttach)) then {
        // TRACE_4("can attach",_target,_intersectObject,_ignoreParent,_ignoreRope);
        GVAR(attachHelper) setPosASL _intersectPosition;
        _hintLMB = LLSTRING(attach);

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
