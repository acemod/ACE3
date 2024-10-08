#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Causes the unit to detonate the passed explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Max range (-1 to ignore) <NUMBER>
 * 2: Explosive <ARRAY>
 * - 0: Explosive <OBJECT>
 * - 1: Fuse time <NUMBER>
 * 3: Trigger Item Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 100, [Explosive, 1], "ACE_Clacker"] call ACE_Explosives_fnc_detonateExplosive; // has to be within range
 * [player, -1, [Explosive, 1], "ACE_Cellphone"] call ACE_Explosives_fnc_detonateExplosive; // range ignored.
 *
 * Public: Yes
 */

params ["_unit", "_range", "_item", ["_triggerClassname", "#unknown", [""]]];
TRACE_4("detonateExplosive",_unit,_range,_item,_triggerClassname);

private _ignoreRange = (_range == -1);
if (!_ignoreRange && {(_unit distance (_item select 0)) > _range}) exitWith {TRACE_1("out of range",_range); false};

private _result = true;

if !([_unit, _range, _item select 0, _item select 1, _triggerClassname] call FUNC(checkDetonateHandlers)) exitWith {false};

if (isNull (_item select 0)) then {
    WARNING_1("Explosive is null [%1]",_this);
};

[QGVAR(detonate), [_unit, _item select 0, _item select 1]] call CBA_fnc_serverEvent;

_result
