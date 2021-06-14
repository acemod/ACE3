#include "script_component.hpp"
/*
 * Author: Ruthberg, commy2, esteldunedain, BaerMitUmlaut
 * Checks if a unit can dig a trench.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can dig <BOOL>
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_canDigTrench
 *
 * Public: No
 */

params ["_unit"];

private _allowedTools = ["ACE_EntrenchingTool", "vn_m_m51_etool_01", "vn_m_shovel_01"];
private _uniqueItems = _unit call EFUNC(common,uniqueItems);
_uniqueItems pushBack handgunWeapon _unit;

if ((_allowedTools arrayIntersect _uniqueItems) isEqualTo []) exitWith {false};

_unit call EFUNC(common,canDig)
