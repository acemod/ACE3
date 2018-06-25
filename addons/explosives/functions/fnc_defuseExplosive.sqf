#include "script_component.hpp"
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

params ["_unit", "_explosive"];
TRACE_2("params",_unit,_explosive);

if (GVAR(ExplodeOnDefuse) && {(random 1.0) < (getNumber (ConfigFile >> "CfgAmmo" >> typeOf _explosive >> QGVAR(explodeOnDefuseChance)))}) exitWith {
    TRACE_1("exploding on defuse",_explosive);
    [_unit, -1, [_explosive, 1], "#ExplodeOnDefuse"] call FUNC(detonateExplosive);
    [QGVAR(explodeOnDefuse), [_explosive, _unit]] call CBA_fnc_globalEvent;
};

_unit action ["Deactivate", _unit, _explosive];
[QGVAR(defuse), [_explosive, _unit]] call CBA_fnc_globalEvent;
