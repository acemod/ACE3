/*
 * Author: Garth 'L-H' de Wet
 * Causes the unit to defuse the passed explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Explosive <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ACE_Interaction_Target] call ACE_Explosives_fnc_defuseExplosive;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_explosive"];
TRACE_2("params",_unit,_explosive);

if (GVAR(ExplodeOnDefuse) && {(random 1.0) < (getNumber (ConfigFile >> "CfgAmmo" >> typeOf _explosive >> "ACE_explodeOnDefuse"))}) exitWith {
    TRACE_1("exploding on defuse",_explosive);
    [_unit, -1, [_explosive, 1], true] call FUNC(detonateExplosive);
};

_unit action ["Deactivate", _unit, _explosive];
