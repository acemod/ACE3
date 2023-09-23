#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Checks the conditions for being able to remove handcuffs
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canRemoveHandcuffs
 *
 * Public: No
 */

params ["_unit", "_target"];

private _unitItems = _unit call EFUNC(common,uniqueItems);
private _restraintLocked = _target getVariable [QGVAR(cuffs), "ACE_CableTie"] findAny GVAR(lockedRestraints) != -1;

//Unit is handcuffed and not currently being escorted
_target getVariable [QGVAR(isHandcuffed), false] &&
{isNull (attachedTo _target)} &&
{(vehicle _target) == _target} &&
{(_restraintLocked && (_unitItems findAny GVAR(keys) != -1)) || !_restraintLocked}
