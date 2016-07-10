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

if (GVAR(ExplodeOnDefuse) && {(random 1.0) < (getNumber (ConfigFile >> "CfgAmmo" >> typeOf _explosive >> QGVAR(explodeOnDefuseChance)))}) exitWith {
    TRACE_1("exploding on defuse",_explosive);
    [_unit, -1, [_explosive, 1], true] call FUNC(detonateExplosive);
    [QGVAR(explodeOnDefuse), [_explosive, _unit]] call CBA_fnc_globalEvent;
};

[QGVAR(defuse), [_explosive, _unit]] call CBA_fnc_globalEvent;

if (!(_explosive isKindOf "UnderwaterMine_Range_Ammo")) then {
    _unit action ["Deactivate", _unit, _explosive];
} else {
    // Underwater naval mines don't seem to respond to the deactivate action
    // For now, lets just delete them
    deleteVehicle _explosive;
};
