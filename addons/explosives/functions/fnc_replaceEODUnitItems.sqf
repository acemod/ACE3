#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Replaces ToolKit with ACE EOD tools for EOD unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_explosives_fnc_replaceEODUnitItems
 *
 * Public: No
 */

params ["_unit"];

private _config = configOf _unit;
if (getNumber (_config >> "canDeactivateMines") == 0) exitWith {};

private _items = getArray (_config >> "items");
if (
    "ACE_DefusalKit" in _items
    || {!([_unit, "ToolKit"] call EFUNC(common,hasItem))}
    || {[_unit, "ACE_DefusalKit"] call EFUNC(common,hasItem)}
) exitWith {};

TRACE_2("",_unit,typeOf _unit);

if !(_unit call EFUNC(common,isEngineer)) then {_unit removeItem "ToolKit"};

_unit addItem "ACE_Clacker";
_unit addItem "ACE_DefusalKit";
