#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles various fire objects and determines if local units deserves to get burned.
 * Used to handle external burning objects, not used internally because internal methods are more performant.
 *
 * Arguments:
 * 0: Unit on fire <OBJECT>
 * 1: PFH Handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_fire_fnc_fireManagerPFH, 0.25, [_unit]] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

params ["_args", "_handle"];

[GVAR(fireSources), {
    _value params ["", "", "", "_condition", "_conditionArgs"];
    _conditionArgs call _condition;
}] call CBA_fnc_hashFilter;

[GVAR(fireSources), {
    _value params ["_source", "_radius", "_intensity"];
    private _attachedObject = attachedTo _source;
    private _sourcePos = getPosATL _source;
    if (_attachedObject isNotEqualTo objNull) then {
        _sourcePos = getPosATL _attachedObject;
    };

    private _nearEntities = _sourcePos nearEntities ["Man", _radius];
    {
        private _burning = [_x] call FUNC(isBurning);
        if !(_burning) then {
            private _distancePercent = 1 - ((_sourcePos distance _x) / _radius);
            [QGVAR(burn), [_x, _intensity * _distancePercent]] call CBA_fnc_globalEvent;
        };
    } forEach _nearEntities;
}] call CBA_fnc_hashEachPair;
