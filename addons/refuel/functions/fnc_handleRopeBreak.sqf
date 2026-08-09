#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Handle rope (fuel hose) breaking, due to overstretching.
 *
 * Arguments:
 * 0: Object that rope is attached from (parent) <OBJECT>
 * 1: Rope <OBJECT>
 * 2: Object that rope is attached to (child) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, _rope, _child] call ace_refuel_fnc_handleRopeBreak
 *
 * Public: No
 */

params ["_object", "_rope", "_attachedObject"];
TRACE_3("rope broken",_object,_rope,_attachedObject);

if (!local _object) exitWith {};

private _nozzle = _object getVariable [QGVAR(ownedNozzle), objNull];

if (_attachedObject != _nozzle) exitWith {};

private _ropeEndPosition = ropeEndPosition _rope;

_ropeEndPosition = if (_ropeEndPosition isNotEqualTo []) then {
    AGLToASL (_ropeEndPosition select 1)
} else {
    nil
};

private _unit = attachedTo _nozzle;

if !(_unit isKindOf "CAManBase") then {
    _unit = objNull;
};

[_unit, _nozzle, false, _ropeEndPosition] call FUNC(disconnect);
[_nozzle, [0, -0.20, 0.12]] ropeAttachTo _rope;

if (isNull _unit) exitWith {};

[LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);
