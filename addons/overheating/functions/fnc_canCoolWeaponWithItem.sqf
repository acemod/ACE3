#include "script_component.hpp"
/*
 * Author: drofseh
 * Return true if the target's weapon can be cooled with an item in the player's inventory
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Bool <BOOL>
 *
 * Example:
 * [bob, joe] call ace_overheating_fnc_canCoolWeaponWithItem
 *
 * Public: No
 */

params ["_player", "_unit"];
TRACE_2("_player, _unit",_player, _unit);

private _return = false;

if (
    GVAR(enabled)
    && {isClass (configfile >> "CfgPatches" >> "acex_field_rations")}
    && {[_unit, currentWeapon _unit] call FUNC(getWeaponTemperature) > (ambientTemperature select 0)}
) then {
    {
        if (getNumber (configFile >> "CfgWeapons" >> _x >> QEXGVAR(field_rations,thirstQuenched)) > 0) exitWith {
            _return = true;
        };
    } forEach (_player call EFUNC(common,uniqueItems));
};

_return
