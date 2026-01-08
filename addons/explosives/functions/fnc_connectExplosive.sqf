#include "..\script_component.hpp"
/*
 * Author: VKing
 * Adds preplaced explosives to a unit's detonator.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Explosive object <OBJECT> (default: objNull)
 * 2: Detonator type <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_object", objNull, [objNull]], ["_detonator", "", [""]]];
TRACE_3("params",_unit,_object,_detonator);

if (!alive _unit || {!alive _object} || {_detonator == ""}) exitWith {};

private _detonatorConfig = getText (configFile >> "CfgWeapons" >> _detonator >> QGVAR(triggerType));
private _magazineClass = getText (configOf _object >> QGVAR(magazine));

if (_detonatorConfig == "" || {_magazineClass == ""}) exitWith {};

[_unit, _object, _magazineClass, [configFile >> "ACE_Triggers" >> _detonatorConfig]] call FUNC(addClacker);
