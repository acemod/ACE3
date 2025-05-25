#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, mharis001
 * Checks if given unit has any placeable explosives on them.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has explosives <BOOL>
 *
 * Example:
 * player call ace_explosives_fnc_hasExplosives
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("params",_unit);

if (isNull _unit) exitWith {
    false // return
};

private _cfgMagazines = configFile >> "CfgMagazines";

(([_unit, 2] call EFUNC(common,uniqueItems)) findIf {getNumber (_cfgMagazines >> _x >> QGVAR(placeable)) == 1}) != -1 // return
