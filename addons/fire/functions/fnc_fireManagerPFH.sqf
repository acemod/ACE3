#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles various fire objects and determines if local units deserves to get burned.
 * Used to handle external burning objects, not used internally because internal methods are more performant.
 *
 * Arguments:
 * 0: Args (not used) <ARRAY>
 * 1: PFH Handle (not used) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_fire_fnc_fireManagerPFH, 0.25] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

private _attachedObject = objNull;
private _sourcePos = [];
private _distancePercent = 0;

{
    _y params ["_source", "_radius", "_intensity", "_condition", "_conditionArgs"];

    // Remove when condition is no longer valid
    if !(_conditionArgs call _condition) then {
        GVAR(fireSources) deleteAt _x;

        continue;
    };

    _attachedObject = attachedTo _source;
    _sourcePos = ASLtoAGL getPosASL ([_source, _attachedObject] select (!isNull _attachedObject));

    // Burn units close to the fire
    {
        if !(_x call FUNC(isBurning)) then {
            _distancePercent = 1 - ((_sourcePos distance _x) / _radius);

            [QGVAR(burn), [_x, _intensity * _distancePercent], _x] call CBA_fnc_targetEvent;
        };
    } forEach (_sourcePos nearEntities ["CAManBase", _radius]);
} forEach GVAR(fireSources);
