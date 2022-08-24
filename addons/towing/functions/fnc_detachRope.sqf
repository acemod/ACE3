#include "script_component.hpp"
/*
 * Author: Dystopian
 * Detaches rope of given hook and gives rope item back.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Rope Hook <OBJECT>
 * 2: Deleted object <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_towing_fnc_detachRope
 *
 * Public: No
 */
params ["_unit", "_hook", ["_deletedObject", objNull]];

private _parent = _hook getVariable QGVAR(parent);
private _child = _hook getVariable QGVAR(child);
private _rope = _hook getVariable QGVAR(rope);

TRACE_6("detachRope",_unit,_parent,_child,_hook,_rope,_deletedObject);

ropeDestroy _rope; // can run on client

if (!isNull _unit) then {
    private _ropeClass = _hook getVariable [QGVAR(ropeClass), ""];
    TRACE_1("rope",_ropeClass);
    if (!isNull _unit && {_ropeClass isNotEqualTo ""}) then {
        [_unit, _ropeClass, true] call CBA_fnc_addItem;
    };
};

detach _hook;
deleteVehicle _hook;

// cleanup object variables and EHs only if function isn't called from Deleted EH
if (isNull _deletedObject || {_parent isNotEqualTo _deletedObject}) then {
    private _parentChildHooks = _parent getVariable [QGVAR(childHooks), []];
    _parentChildHooks = _parentChildHooks - [_hook];
    _parent setVariable [QGVAR(childHooks), _parentChildHooks, true];

    if (_parentChildHooks isEqualTo []) then {
        [QGVAR(cleanupParent), _parent] call CBA_fnc_serverEvent;
    };
};

if (isNull _deletedObject || {_child isNotEqualTo _deletedObject}) then {
    private _childParentHooks = _child getVariable [QGVAR(parentHooks), []];
    _childParentHooks = _childParentHooks - [_hook];
    _child setVariable [QGVAR(parentHooks), _childParentHooks, true];

    if (_childParentHooks isEqualTo []) then {
        [QGVAR(detachChild), _child] call CBA_fnc_globalEvent;
    };
};
