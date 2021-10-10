#include "script_component.hpp"
/*
 * Author: VKing
 * Add preplaced explosives to a unit's detonator.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Explosive object <OBJECT>
 * 2: Detonator type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, claymore1, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive
 *
 * Public: Yes
 */

params ["_unit", "_object", "_detonator"];
TRACE_3("Params",_unit,_object,_detonator);

private _detonatorConfig = getText (configFile >> "CfgWeapons" >> _detonator >> QGVAR(triggerType));

private _magazineClass = getText (configFile >> "CfgAmmo" >> typeOf _object >> QGVAR(magazine));

[_unit, _object, _magazineClass, [configFile >> "ACE_Triggers" >> _detonatorConfig]] call FUNC(addClacker);
