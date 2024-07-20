#include "..\script_component.hpp"
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

private _hookVars = _hook getVariable QGVAR(vars);
if (isNil "_hookVars") then { // this is hookParent
    _hook = _hook getVariable QGVAR(hook);
    _hookVars = _hook getVariable QGVAR(vars);
};

_hookVars params ["_parent", "_child", "_rope", "_ropeClass", "_hookParent"];

TRACE_8("detachRope",_unit,_parent,_child,_hook,_hookParent,_rope,_ropeClass,_deletedObject);

ropeDestroy _rope; // can run on client

if (!isNull _unit && {_ropeClass isNotEqualTo ""}) then {
    [_unit, _ropeClass, true] call CBA_fnc_addItem;
};

{
    detach _x;
    deleteVehicle _x;
} forEach [_hook, _hookParent];

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
