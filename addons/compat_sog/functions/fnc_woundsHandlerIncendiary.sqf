#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Custom wound handler for SOG: PF explosive incendiary ammunition.
 * Determines if the unit should be ignited and passes the damage to other wound handlers.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 *
 * Return Value:
 * Input <ARRAY>
 *
 * Example:
 * [player, [[0.5, "Body", 5]]] call ace_compat_sog_fnc_woundsHandlerIncendiary
 *
 * Public: No
 */

#define BURN_THRESHOLD 1

params ["_unit", "_damages"];
TRACE_2("woundsHandlerIncendiary",_unit,_damages);

private _fireDamage = 0;
{
    _x params ["", "", "_damage"];
    _fireDamage = _fireDamage + _damage;
} forEach _damages;

private _intensity = linearConversion [0, 20, _fireDamage, 0, 10, true];
TRACE_2("",_intensity,_fireDamage);

if (_intensity > BURN_THRESHOLD) then {
    TRACE_2("Setting unit ablaze",_intensity,BURN_THRESHOLD);
    ["ace_fire_burn", [_unit, _intensity]] call CBA_fnc_globalEvent;
};

_this // return
