#include "..\script_component.hpp"
/*
 * Author: drofseh
 * Return true if the target's weapon can be cooled with an item in the player's inventory
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Bool <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_overheating_fnc_canCoolWeaponWithItem
 *
 * Public: No
 */

params ["_unit", "_player"];
TRACE_2("canCoolWeaponWithItem",_unit,_player);

GVAR(enabled)
&& {["acex_field_rations"] call EFUNC(common,isModLoaded)}
&& {!(_unit getVariable [QEGVAR(captives,isSurrendering), false])} // interaction point will overlap with ace_captives
&& {!(_unit getVariable [QEGVAR(captives,isHandcuffed), false])}
&& {[_unit, currentWeapon _unit] call FUNC(getWeaponTemperature) > (ambientTemperature select 0)}
&& {((_player call EFUNC(common,uniqueItems)) findIf {getNumber (configFile >> "CfgWeapons" >> _x >> QEXGVAR(field_rations,thirstQuenched)) > 0}) != -1}
