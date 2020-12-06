#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * handleDamage EH.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"] call ace_nonlethal_fnc_handleDamage
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

systemChat "EH Fired!";
// Exit if bullet is not part of NonLethal
private _nonlethalType = getText (configFile >> "CfgAmmo" >> _projectile >> "ACE_nonLethalType");
if !(_nonlethalType isEqualTo "") exitWith {};

// Calculate how much of an effect the nonlethal has had on the unit
private _threshold = (_unit getVariable [QGVAR(threshold), 0]) + (_damage * ((1 - (_unit skill "courage")) * 2));
_unit setVariable [QGVAR(threshold), _threshold];

// Update unit status
if !(_unit getVariable [QGVAR(limp), false]) then {
    if ((_threshold >= 1) && (random 1 >= 0.3)) then {
        [_unit, "forceWalk", QGVAR(sumDamage), _hasLegSplint] call EFUNC(common,statusEffect_set);
    };
};

if !(_unit getVariable [QGVAR(surrendering), false]) then {
    if (((_threshold > 0) && ((_unit skill "courage") < 0.25)) || ((_threshold >= 3) && (random 1 >= 0.2))) then {
        [_unit, true] call EFUNC(captives,setSurrendered);
    };
};

nil
