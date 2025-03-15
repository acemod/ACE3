#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Causes the unit to defuse the passed explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Explosive <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_explosives_fnc_defuseExplosive
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_explosive", objNull, [objNull]]];
TRACE_2("params",_unit,_explosive);

if (!alive _unit || {isNull _explosive}) exitWith {};

if (GVAR(explodeOnDefuse) && {random 1 < getNumber (configOf _explosive >> QGVAR(explodeOnDefuseChance))}) exitWith {
    TRACE_1("exploding on defuse",_explosive);

    [_unit, -1, [_explosive, 1], "#ExplodeOnDefuse"] call FUNC(detonateExplosive);

    // API
    [QGVAR(explodeOnDefuse), [_explosive, _unit]] call CBA_fnc_globalEvent;
};

_unit action ["Deactivate", _unit, _explosive];

// API
[QGVAR(defuse), [_explosive, _unit]] call CBA_fnc_globalEvent;
